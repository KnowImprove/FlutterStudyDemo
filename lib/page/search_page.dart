import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_github/page/webview_brower.dart';
import 'package:flutter_study_github/view/button_tag_hot_key_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/common_entity.dart';
import '../model/seach_hot_key_model_entity.dart';
import '../model/search_key_result_model_entity.dart';
import '../model/userinfo_model.dart';
import 'login_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController? _controller = TextEditingController();

  List<SeachHotKeyModelData>? hotKeyLists = [];

  //搜索结果
  List<SearchKeyResultModelDataDatas>? searchDatas = [];

  bool isSearchResult = false;

  int _page = 0;

  String searchResultTip = "搜点什么吧~";

  @override
  void initState() {
    super.initState();
    getHttp();
    _controller?.addListener(() {
      setState(() {
        isSearchResult = false;
        searchResultTip = "搜点什么吧~";
      });
    });
  }

  void getHttp() async {
    try {
      var wxHotKeyResponse = await HttpUtil.getInstance().get(Api.HOT_KEY);
      Map<String, dynamic> wxMap = json.decode(wxHotKeyResponse.toString());
      var hotKeyEntity = SeachHotKeyModelEntity.fromJson(wxMap);
      print(hotKeyEntity.toString());

      setState(() {
        hotKeyLists = hotKeyEntity.data!;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: TextField(
          controller: _controller,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          autofocus: true,
          showCursor: true,
          cursorColor: Colors.white,
          onChanged: (value) => {print("value = $value")},
          decoration: InputDecoration(
              suffixIcon: _controller!.value.text.isNotEmpty
                  ? IconButton(
                      //如果文本长度不为空则显示清除按钮
                      onPressed: () {
                        _controller?.clear();
                        FocusScope.of(context).requestFocus(); //获取焦点，弹起键盘
                      },
                      icon: const Icon(Icons.cancel, color: Colors.white))
                  : null,
              hintText: "请输入搜索内容",
              hintStyle: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () => {
                // Fluttertoast.showToast(msg: "nihao")
                // print("------输入内容")
                doSearchRequest(_controller!.value.text)
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: buildContentView(),
      ),
    );
  }

  //isSearchResult
  Widget buildContentView() {
    if (isSearchResult) {
      return EasyRefresh(
        header: ClassicalHeader(
          refreshText: "下拉刷新",
          refreshReadyText: "松开后开始刷新",
          refreshingText: "正在刷新...",
          refreshedText: "刷新完成",
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          infoText: '更新于 %T',
        ),
        footer: ClassicalFooter(
            loadText: "上拉加载更多",
            loadReadyText: "松开后开始加载",
            loadingText: "正在加载...",
            loadedText: "加载完成",
            noMoreText: "没有更多内容了",
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            infoText: '更新于 %T'),
        child: ListView.builder(
            itemCount: searchDatas?.length,
            itemBuilder: (context, index) {
              return buildListItem(index, searchDatas![index]);
            }),
        onRefresh: () async {
          doSearchRequest(_controller!.value.text);
          setState(() {
            _page = 0;
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 1), () async {
            setState(() {
              _page++;
            });
            getMoreData(_controller!.value.text);
          });
        },
      );
      // return ListView.builder(
      //     itemCount: searchDatas?.length,
      //     itemBuilder: (context, index) {
      //       return buildListItem(index, searchDatas![index]);
      //     });
    } else {
      return buildHotKeyView();
    }
  }

  Future getMoreData(String searchKey) async {
    Map<String, String> data;
    data = {"k": searchKey};

    var response = await HttpUtil.getInstance()
        .post(Api.QUERY + "$_page/json", data: data);
    Map<String, dynamic> userMap = json.decode(response.toString());
    var searchResult = SearchKeyResultModelEntity.fromJson(userMap);
    setState(() {
      searchDatas?.addAll(searchResult.data!.datas!);
    });
  }

  Widget buildListItem(int index, SearchKeyResultModelDataDatas article) {
    bool? isLogin = SpUtil.getBool("login", defValue: false);

    return InkWell(
      onTap: () {
        clickArticle(article);
      },
      child: SizedBox(
        height: 180.h,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  // color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            article.title!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: getIconByArticle(article),
                            onTap: () {
                              print("------$index------");
                              if (!isLogin!) {
                                Fluttertoast.showToast(msg: "请先登录！");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              } else {
                                if (article.collect!) {
                                  cancelCollect(index, article.id!);
                                } else {
                                  collect(index, article.id!);
                                }
                              }
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: const Icon(
                              Icons.access_time,
                              size: 20,
                              color: Colors.black12,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              article.niceDate!,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                checkAuthorName(article),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 140.w,
                height: 140.h,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(20.h),
                child: CircleAvatar(
                  radius: 60.w,
                  backgroundColor: getRandomColor(index),
                  child: Text(
                    article.superChapterName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
              // Image(image: NetworkImage)
            ],
          ),
        ),
      ),
    );
  }

  String checkAuthorName(SearchKeyResultModelDataDatas article) {
    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser == null || article.shareUser!.isEmpty) {
        return article.chapterName!;
      } else {
        return article.shareUser!;
      }
    }
    return article.author!;
  }

  Future collect(int index, int articleId) async {
    var response =
        await HttpUtil.getInstance().post(Api.COLLECT + "$articleId/json");
    Map<String, dynamic> map = json.decode(response.toString());
    var commonEntity = CommonEntity.fromJson(map);
    if (commonEntity.errorCode == -1001) {
      // //退出
      HttpUtil.getInstance().get(Api.LOGOUT);
      SpUtil.clear();
      Provider.of<UserInfo>(context, listen: false).setUserInfo(null);
      Fluttertoast.showToast(msg: '登录失效，请重新登录~');
    } else {
      searchDatas![index].collect = true;
      setState(() {
        searchDatas = searchDatas;
      });
      Fluttertoast.showToast(msg: '收藏成功~');
    }
  }

  Future cancelCollect(int index, int articleId) async {
    var response = await HttpUtil.getInstance()
        .post(Api.UN_COLLECT_ORIGIN_ID + "$articleId/json");
    Map<String, dynamic> map = json.decode(response.toString());
    var commonEntity = CommonEntity.fromJson(map);
    if (commonEntity.errorCode == -1001) {
      // //退出
      HttpUtil.getInstance().get(Api.LOGOUT);
      SpUtil.clear();
      Provider.of<UserInfo>(context, listen: false).setUserInfo(null);
      Fluttertoast.showToast(msg: '登录失效，请重新登录~');
    } else {
      searchDatas![index].collect = false;
      setState(() {
        searchDatas = searchDatas;
      });
      Fluttertoast.showToast(msg: '取消收藏~');
    }
  }

  Widget getIconByArticle(SearchKeyResultModelDataDatas article) {
    if (article.collect!) {
      return const Icon(
        Icons.star,
        size: 25,
        color: Colors.yellow,
      );
    }

    return const Icon(
      Icons.star_border,
      size: 25,
      color: Colors.black12,
    );
  }

  ///点击文章跳转处理
  void clickArticle(SearchKeyResultModelDataDatas article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Browser(title: article.title!, url: article.link!),
      ),
    );
  }

  /// 单个热搜widget
  Widget buildHotKeyView() {
    if (null == hotKeyLists || hotKeyLists!.isEmpty) {
      return Container(
        child: Column(
          children: [
            const Icon(
              Icons.search,
              color: Colors.pink,
              size: 45,
            ),
            Text(searchResultTip)
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Padding(
          child: Wrap(
            children: hotKeyLists!
                .asMap()
                .entries
                .map((entry) => ButtonHotKey(
                      textKeys: entry.value.name!,
                      color: getRandomColor(entry.key),
                      changeSearchKeyCallBack: (searchKey) {
                        print("------$searchKey");
                        _controller?.value = TextEditingValue(
                          text: searchKey,
                          selection:
                              TextSelection.collapsed(offset: searchKey.length),
                          composing: TextRange.empty,
                        );
                        doSearchRequest(searchKey);
                      },
                    ))
                .toList(),
            spacing: 15,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
          ),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      );
      ;
    }
  }

  Future doSearchRequest(String serachKey) async {
    Map<String, String> data;
    data = {"k": serachKey};

    var response = await HttpUtil.getInstance()
        .post(Api.QUERY + "$_page/json", data: data);
    Map<String, dynamic> userMap = json.decode(response.toString());
    var searchResult = SearchKeyResultModelEntity.fromJson(userMap);
    if (searchResult.errorCode == 0) {
      if (null == searchResult.data ||
          null == searchResult.data!.datas ||
          searchResult.data!.datas!.length == 0) {
        // setState(() {
        //   searchResultTip = "暂无搜索结果~";
        //   isSearchResult = false;
        // });
        Fluttertoast.showToast(msg: "无搜索结果，换个其他词试试呢~");
      } else {
        setState(() {
          searchDatas = searchResult.data?.datas!;
          isSearchResult = true;
          //收起键盘
          FocusScope.of(context).unfocus(); //取消焦点
        });
      }
    } else {
      Fluttertoast.showToast(msg: userMap['errorMsg']);
    }
  }

  Color getRandomColor(int index) {
    // var rng = Random(); //随机数生成类
    // var randomValue = rng.nextInt(4); //0-3
    var randomValue = index % 4; //0-3
    switch (randomValue) {
      case 0:
        return Colors.purpleAccent;
      case 1:
        return Colors.blueAccent;
      case 2:
        return Colors.deepPurpleAccent;
      case 3:
        return Colors.lightBlue;
      case 4:
        return Colors.greenAccent;
      case 5:
        return Colors.yellow;
    }
    return Colors.deepOrangeAccent;
  }
}
