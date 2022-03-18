import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study_github/view/button_tag_hot_key_item.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/seach_hot_key_model_entity.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController? _controller = TextEditingController();

  List<SeachHotKeyModelData>? hotKeyLists = [];

  bool isSearchResult = false;

  @override
  void initState() {
    super.initState();
    getHttp();
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
          decoration: const InputDecoration(
              // suffixIcon: Icon(
              //   Icons.close,
              //   color: Colors.white,
              //   size: 15,
              // ),
              hintText: "请输入搜索内容",
              hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () => {print("------输入内容：${_controller?.value.text}")},
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

  Widget buildContentView() {
    if (isSearchResult) {
      return Text("这是搜索结果显示页面，返回一个list展示搜索结果");
    } else {
      return buildHotKeyView();
    }
  }

  Widget buildHotKeyView() {
    if (null == hotKeyLists || hotKeyLists!.isEmpty) {
      return Container(
        child: Column(
          children: const [
            Icon(
              Icons.search,
              color: Colors.pink,
              size: 45,
            ),
            Text("搜点什么吧~")
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
