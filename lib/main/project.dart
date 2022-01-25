import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//开源项目
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("你好，我是project Page！"),
    );
  }
}
