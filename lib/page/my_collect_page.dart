import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study_github/view/common_article_list_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/collect_list_response_model_entity.dart';
import '../model/userinfo_model.dart';
import 'login_page.dart';

class CollectListPage extends StatefulWidget {
  const CollectListPage({
    Key? key,
    // required this.url,
    // required this.title,
  }) : super(key: key);

  // final String url;
  // final String title;

  @override
  _CollectState createState() => _CollectState();
}

class _CollectState extends State<CollectListPage> {
  @override
  void initState() {
    super.initState();
    _getRefresh(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
      body: Container(
        child: CommonArticleList(
          key: childKey,
          refreshPostCall: (page) => _getRefresh(page),
          morePostCall: (page) => _getMore(page),
        ),
      ),
    );
  }

  //
  _getRefresh(int page) async {
    print("---refresh---$page");
    try {
      var wxHotKeyResponse =
          await HttpUtil.getInstance().get(Api.COLLECT_LIST + "$page/json");
      Map<String, dynamic> wxMap = json.decode(wxHotKeyResponse.toString());
      var collectListEntity = CollectListResponseModelEntity.fromJson(wxMap);
      print(collectListEntity.toString());

      if (collectListEntity.errorCode == -1001) {
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
        collectListEntity.data!.datas!.forEach((element) {
          element.collect = true;
          element.superChapterName = "匿名";
        });
        childKey.currentState
            ?.setCurrentRefreshData(collectListEntity.data!.datas!);
      }
    } catch (e) {
      print(e);
    }
  }

  _getMore(int page) async {
    print("---more---$page");
    try {
      var wxHotKeyResponse =
          await HttpUtil.getInstance().get(Api.COLLECT_LIST + "$page/json");
      Map<String, dynamic> wxMap = json.decode(wxHotKeyResponse.toString());
      var collectListEntity = CollectListResponseModelEntity.fromJson(wxMap);
      print(collectListEntity.toString());
      if (collectListEntity.errorCode == -1001) {
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
        collectListEntity.data!.datas!.forEach((element) {
          element.collect = true;
          element.superChapterName = "匿名";
        });
        childKey.currentState
            ?.setCurrentMoreData(collectListEntity.data!.datas!);
      }
    } catch (e) {
      print(e);
    }
  }
}
