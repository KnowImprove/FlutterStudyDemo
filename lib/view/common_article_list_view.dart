import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/common_entity.dart';
import '../model/userinfo_model.dart';
import '../page/login_page.dart';
import '../page/webview_brower.dart';

GlobalKey<_CommonArticleListState> childKey = GlobalKey();

class CommonArticleList extends StatefulWidget {
  final refreshPostCall;
  final morePostCall;

  const CommonArticleList({Key? key, this.refreshPostCall, this.morePostCall})
      : super(key: key);

  @override
  _CommonArticleListState createState() => _CommonArticleListState();
}

class _CommonArticleListState<T> extends State<CommonArticleList> {
  int _page = 0;

  List listDatas = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
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
            child: buildListParent(),
            onRefresh: () async {
              // getHttp();
              setState(() {
                _page = 0;
              });
              widget.refreshPostCall(_page);
            },
            onLoad: () async {
              await Future.delayed(const Duration(seconds: 1), () async {
                setState(() {
                  _page++;
                });
                widget.morePostCall(_page);
              });
            },
          ))
        ],
      ),
    );
  }

  Widget buildListParent() {
    if (listDatas.isNotEmpty) {
      return ListView.builder(
          itemCount: listDatas.length,
          itemBuilder: (context, index) {
            return buildListItem(index, listDatas[index]);
          });
    } else {
      return Container(
        child: const Text("没有收藏内容~"),
      );
    }
  }

  Widget buildListItem(int index, dynamic article) {
    bool? isLogin = SpUtil.getBool("login", defValue: false);
    print("article = $article");

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

  void setCurrentRefreshData(List<T> listData) {
    setState(() {
      listDatas = listData;
    });
  }

  void setCurrentMoreData(List<T> listData) {
    setState(() {
      listDatas.addAll(listData);
    });
  }

  void clickArticle(dynamic article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Browser(title: article.title!, url: article.link!),
      ),
    );
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
      listDatas[index].collect = true;
      setState(() {
        listDatas = listDatas;
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
      listDatas[index].collect = false;
      setState(() {
        listDatas = listDatas;
      });
      Fluttertoast.showToast(msg: '取消收藏~');
    }
  }

  Widget getIconByArticle(dynamic article) {
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

  String checkAuthorName(dynamic article) {
    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser == null || article.shareUser!.isEmpty) {
        return article.chapterName!;
      } else {
        return article.shareUser!;
      }
    }
    return article.author!;
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
}
