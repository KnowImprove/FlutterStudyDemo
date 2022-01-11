import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//个人中心测试
class minePage extends StatefulWidget {
  const minePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<minePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是Mine Page！"),
    );
  }
}
