import 'package:flutter/cupertino.dart';

class CommontListItem extends StatefulWidget {
  const CommontListItem({Key? key}) : super(key: key);

  @override
  _CommontListItemState createState() => _CommontListItemState();
}

class _CommontListItemState extends State<CommontListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("hello"));
  }
}
