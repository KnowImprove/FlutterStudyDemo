import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_github/model/user_entity.dart';
import 'package:flutter_study_github/model/userinfo_model.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

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
      child: getPageTitle(Provider.of<UserInfo>(context).userEntity),
    );
  }

  Widget getPageTitle(UserEntity? userEntity) {
    if (null == userEntity || null == userEntity.data) {
      UserEntity? userEntityNew =
          SpUtil.getObj("user", (v) => UserEntity.fromJsonPro(v));
      if (null == userEntityNew || null == userEntityNew.data) {
        return const Text("你好，我是Mine Page!");
      }
      return Text("你好，我是Mine Page！:" + userEntityNew.data!.username!);
    } else {
      // SpUtil.putObject("login", true);
      return Text("你好，Mine Page！:" + userEntity.data!.username!);
    }
  }
}
