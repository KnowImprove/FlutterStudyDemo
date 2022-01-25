import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 微信公众号相关页面
class WxPage extends StatefulWidget {
  const WxPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是微信公众号 Page！"),
    );
  }
}
