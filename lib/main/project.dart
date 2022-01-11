import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//开源项目
class projectPage extends StatefulWidget {
  const projectPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<projectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是project Page！"),
    );
  }
}
