import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_github/page/webview_brower.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/wx_chat_details_model_entity.dart';

class FragmentProject extends StatefulWidget {
  int id;

  FragmentProject(this.id, {Key? key}) : super(key: key);

  @override
  _AState createState() => _AState(id);
}

class _AState extends State<FragmentProject>
    with AutomaticKeepAliveClientMixin {
  List<WxChatDetailsModelDataDatas>? dataVxDetails = [];

  int id;
  bool isLoading = true;
  int page = 1;
  _AState(this.id);

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var wxTabInfoResponse =
          await HttpUtil().get("${Api.PROJECT_LIST}$page/json?cid=$id");
      Map<String, dynamic> wxMap = json.decode(wxTabInfoResponse.toString());
      var wxTabInfoEntity = WxChatDetailsModelEntity.fromJson(wxMap);
      print(wxTabInfoEntity.toString());

      setState(() {
        dataVxDetails = wxTabInfoEntity.data!.datas;
      });
    } catch (e) {
      print(e);
    }
  }

  Future getMoreData() async {
    var wxTabInfoResponse =
        await HttpUtil().get("${Api.PROJECT_LIST}$page/json?cid=$id");
    Map<String, dynamic> wxMap = json.decode(wxTabInfoResponse.toString());
    var wxTabInfoEntity = WxChatDetailsModelEntity.fromJson(wxMap);

    setState(() {
      dataVxDetails!.addAll(wxTabInfoEntity.data!.datas!);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Expanded(
            // margin: EdgeInsets.fromLTRB(0, 300.h, 0, 0),
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height - 300.h,
            // color: Colors.lightGreenAccent,
            child: EasyRefresh(
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
              itemCount: dataVxDetails!.length,
              itemBuilder: (context, index) {
                return buildListItem(index, dataVxDetails![index]);
              }),
          onRefresh: () async {
            getHttp();
            setState(() {
              page = 0;
            });
          },
          onLoad: () async {
            await Future.delayed(const Duration(seconds: 1), () async {
              setState(() {
                page++;
              });
              getMoreData();
            });
          },
        )),
      ),
    );
  }

  void clickArticle(WxChatDetailsModelDataDatas article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Browser(title: article.title!, url: article.link!),
      ),
    );
  }

  Widget buildListItem(int index, WxChatDetailsModelDataDatas article) {
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
                          const Icon(
                            Icons.star_border,
                            size: 25,
                            color: Colors.black12,
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

  Color? getRandomColor(int index) {
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
    }
    return Colors.deepOrangeAccent;
  }

  String checkAuthorName(WxChatDetailsModelDataDatas article) {
    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser == null || article.shareUser!.isEmpty) {
        return article.chapterName!;
      } else {
        return article.shareUser!;
      }
    }
    return article.author!;
  }

  @override
  bool get wantKeepAlive => true;
}
