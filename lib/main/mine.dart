import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_github/model/user_entity.dart';
import 'package:flutter_study_github/page/my_collect_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/userinfo_model.dart';
import '../page/login_page.dart';
import '../page/my_coin_page.dart';

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
    Provider.of<UserInfo>(context).userEntity;

    return Container(
      child: Column(
        children: [
          // getPageTitle(Provider.of<UserInfo>(context).userEntity),
          getMineHeader(),
          getFuncList()
        ],
      ),
    );
  }

  Widget getFuncList() {
    bool? isLogin = SpUtil.getBool("login", defValue: false);

    return Column(
      children: [
        InkWell(
          onTap: () {
            if (!isLogin!) {
              Fluttertoast.showToast(msg: "请先登录！");
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoinListPage(),
                ),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
            child: Row(
              children: const [
                Icon(
                  Icons.add_chart,
                  size: 23,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "我的积分",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (!isLogin!) {
              Fluttertoast.showToast(msg: "请先登录！");
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CollectListPage(),
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Row(
              children: const [
                Icon(
                  Icons.collections,
                  size: 23,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "我的收藏",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (!isLogin!) {
              Fluttertoast.showToast(msg: "请先登录！");
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Row(
              children: const [
                Icon(
                  Icons.share,
                  size: 23,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "分享",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        if (!isLogin!)
          Container()
        else
          InkWell(
            onTap: () {
              _alertDialog();
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.exit_to_app,
                    size: 23,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "退出登录",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }

  _alertDialog() async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("确定要退出登录吗"),
            actions: <Widget>[
              TextButton(
                  child: const Text("取消"),
                  onPressed: () => Navigator.pop(context, "cancel")),
              TextButton(
                  child: const Text("确定"),
                  onPressed: () {
                    // //退出
                    HttpUtil.getInstance().get(Api.LOGOUT);
                    SpUtil.clear();
                    Provider.of<UserInfo>(context, listen: false)
                        .setUserInfo(null);
                    Navigator.pop(context, "yes");
                  }),
            ],
          );
        });
    return alertDialogs;
  }

  Widget getMineHeader() {
    UserEntity? userEntityNew =
        SpUtil.getObj("user", (v) => UserEntity.fromJsonPro(v));

    bool? isLogin = SpUtil.getBool("login", defValue: false);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          if (!isLogin!) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: ClipOval(
                  child: (null == isLogin || !isLogin)
                      ? Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          child: const Icon(
                            Icons.person,
                            size: 55,
                            color: Colors.black12,
                          ),
                        )
                      : Image.asset(
                          'lib/res/images/pig.jpg',
                          width: 100,
                          height: 100,
                        ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    getNameTip(isLogin!, userEntityNew),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String getNameTip(bool isLogin, UserEntity? userEntity) {
    if (isLogin && null != userEntity && null != userEntity.data) {
      return userEntity.data!.username!;
    }
    return "尚未登录，点我登录！";
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
