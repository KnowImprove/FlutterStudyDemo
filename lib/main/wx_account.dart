import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 微信公众号相关页面
class wxPage extends StatefulWidget {
  const wxPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _wxPageState createState() => _wxPageState();
}

class _wxPageState extends State<wxPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是微信公众号 Page！"),
    );
  }
}
