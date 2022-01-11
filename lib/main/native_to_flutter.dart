import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//与原生交互测试相关页面
class nativePage extends StatefulWidget {
  const nativePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _nativePageState createState() => _nativePageState();
}

class _nativePageState extends State<nativePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("与原生功能交互相关！"),
    );
  }
}
