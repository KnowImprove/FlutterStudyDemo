import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//与原生交互测试相关页面
class NativePage extends StatefulWidget {
  const NativePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NativePageState createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("与原生功能交互相关！"),
    );
  }
}
