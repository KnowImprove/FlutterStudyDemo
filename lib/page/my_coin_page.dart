import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_github/page/webview_brower.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/coin_list_response_model_entity.dart';
import '../model/user_info_model_response_entity.dart';
import '../model/userinfo_model.dart';
import 'login_page.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({
    Key? key,
  }) : super(key: key);

  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<CoinListPage> {
  int _page = 0;

  List<CoinListResponseModelDataDatas> listDatas = [];

  UserInfoModelResponseData? userInfoModelResponseData;

  @override
  void initState() {
    super.initState();
    _postUserInfo();
    postIconList(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的积分"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
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
              setState(() {
                _page = 0;
              });
              postIconList(_page);
            },
            onLoad: () async {
              await Future.delayed(const Duration(seconds: 1), () async {
                setState(() {
                  _page++;
                });
                postIconList(_page);
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
            if (index == 0) {
              return buildHeadItem();
            }
            return buildListItem(index - 1, listDatas[index - 1]);
          });
    } else {
      return Container(
        child: const Text("没有任何积分呢~"),
      );
    }
  }

  Widget buildHeadItem() {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: SizedBox(
        height: 200.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${userInfoModelResponseData?.coinInfo?.coinCount}",
              style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(int index, CoinListResponseModelDataDatas coin) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    coin.reason!,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                // Text(
                //   "${coin.coinCount!}",
                //   style: const TextStyle(fontSize: 16, color: Colors.black87),
                // ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        coin.desc!,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height: 1.h,
                  decoration: const BoxDecoration(color: Colors.black12),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              "+${coin.coinCount!}",
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
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

  ///获取个人信息
  _postUserInfo() async {
    try {
      var wxHotKeyResponse = await HttpUtil.getInstance().get(Api.USER_INFO);
      Map<String, dynamic> wxMap = json.decode(wxHotKeyResponse.toString());
      var userInfoEntity = UserInfoModelResponseEntity.fromJson(wxMap);
      print(userInfoEntity.toString());

      if (userInfoEntity.errorCode == -1001) {
        // //退出
        HttpUtil.getInstance().get(Api.LOGOUT);
        SpUtil.clear();
        Provider.of<UserInfo>(context, listen: false).setUserInfo(null);
        Fluttertoast.showToast(msg: '登录失效，请重新登录~');
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        setState(() {
          userInfoModelResponseData = userInfoEntity.data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  postIconList(int page) async {
    print("---more---$page");
    try {
      var wxHotKeyResponse =
          await HttpUtil.getInstance().get(Api.USER_COIN + "$page/json");
      Map<String, dynamic> wxMap = json.decode(wxHotKeyResponse.toString());
      var coinListEntity = CoinListResponseModelEntity.fromJson(wxMap);
      print(coinListEntity.toString());
      if (coinListEntity.errorCode == -1001) {
        // //退出
        HttpUtil.getInstance().get(Api.LOGOUT);
        SpUtil.clear();
        Provider.of<UserInfo>(context, listen: false).setUserInfo(null);
        Fluttertoast.showToast(msg: '登录失效，请重新登录~');
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        setState(() {
          listDatas.addAll(coinListEntity.data!.datas!);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
