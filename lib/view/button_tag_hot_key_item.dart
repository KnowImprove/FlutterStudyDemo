import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonHotKey extends StatelessWidget {
  const ButtonHotKey({Key? key, required this.textKeys, required this.color})
      : super(key: key);

  final String textKeys;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(textKeys),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),

          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
              side: const BorderSide(color: Colors.transparent))), //圆角弧度
        ),
        onPressed: () {
          print("-------点击：$textKeys");
        },
      ),
    );
  }
}
