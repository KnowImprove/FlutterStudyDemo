import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/project_title_tab_model_entity.dart';
import '../page/fragment_project.dart';

//开源项目
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  List<ProjectTitleTabModelData>? dataTitles = [];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    getProjectTabHttp();
  }

  void getProjectTabHttp() async {
    print("start--------------request");
    try {
      var wxTabResponse = await HttpUtil.getInstance().get(Api.PROJECT);
      Map<String, dynamic> wxMap = json.decode(wxTabResponse.toString());
      var wxTabEntity = ProjectTitleTabModelEntity.fromJson(wxMap);
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
        FragmentProject(item.id!),
      );
    }
    return tiles;
  }
}
