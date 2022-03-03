import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_github/common/api.dart';
import 'package:flutter_study_github/http/httpUtil.dart';
import 'package:flutter_study_github/model/wx_tab_title_model_entity.dart';

import '../model/wx_chat_details_model_entity.dart';
import '../page/fragment_wx.dart';

/// 微信公众号相关页面
class WxPage extends StatefulWidget {
  const WxPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<WxTabTitleModelData>? dataTitles = [];

  WxChatDetailsModelData? tabDataInfo;

  @override
  void initState() {
    super.initState();
    getWxTabHttp();
  }

  void getWxTabHttp() async {
    print("start--------------request");
    try {
      var wxTabResponse = await HttpUtil().get(Api.WX_ARTICLE);
      Map<String, dynamic> wxMap = json.decode(wxTabResponse.toString());
      var wxTabEntity = WxTabTitleModelEntity.fromJson(wxMap);
      print(wxTabEntity.toString());

      setState(() => {
            dataTitles = wxTabEntity.data!,
            _tabController =
                TabController(length: dataTitles!.length, vsync: this),
            _tabController!.addListener(() {
              print("scroll index = ${_tabController!.index}");
            })
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: Colors.blue,
                child: Container(
                    height: 56,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      controller: _tabController,
                      tabs: buildTitleItem(),
                      onTap: (index) {
                        print("index=======$index");
                      },
                    )),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController, //tabbar控制器
            children: buildFragmentItem(),
          )),
    );
  }

  /// 获取单个公众号列表数据
  void getWxTabInfoHttp(WxTabTitleModelData titleModelData, int page) async {
    print("start-------info-------request");
    try {
      var wxTabInfoResponse = await HttpUtil()
          .get("${Api.WX_ARTICLE_INFO}${titleModelData.id}/$page/json");
      Map<String, dynamic> wxMap = json.decode(wxTabInfoResponse.toString());
      var wxTabInfoEntity = WxChatDetailsModelEntity.fromJson(wxMap);
      print(wxTabInfoEntity.toString());

      setState(() {
        tabDataInfo = wxTabInfoEntity.data!;
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> buildTitleItem() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    if (dataTitles!.isEmpty) {
      return tiles;
    }
    // for (var item in dataTitles!) {
    for (var i = 0; i < dataTitles!.length; i++) {
      tiles.add(Container(
        // width: 60,
        alignment: Alignment.center,
        child: Text(dataTitles![i].name!),
      ));
    }
    return tiles;
  }

  List<Widget> buildFragmentItem() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    if (dataTitles!.isEmpty) {
      return tiles;
    }
    for (var item in dataTitles!) {
      tiles.add(
        FragmentWx(item.id!),
      );
    }
    return tiles;
  }
}
