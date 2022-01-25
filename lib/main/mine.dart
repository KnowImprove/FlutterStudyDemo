import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//个人中心测试
class MinePage extends StatefulWidget {
  const MinePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是Mine Page！"),
    );
  }
}
