import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_github/model/userinfo_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../main.dart';
import '../model/user_entity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String btnText = "登录";
  String bottomText = "没有账号？注册";
  bool visible = true;
  GlobalKey<FormState> _key = GlobalKey();
  bool autoValidate = false;
  String username = "", password = "", rePassword = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColorDark,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: getBodyView(),
        ),
      ),
    );
  }

  Widget getBodyView() {
    //可滑动布局，避免弹出键盘时会有溢出异常
    return ListView(
      children: <Widget>[
        const SizedBox(height: 80),
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(30),
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        //键盘类型，即输入类型
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: validateUsername,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline),
                            labelText: '请输入账号',
                            hintText: '账号'),
                        onSaved: (text) {
                          setState(() {
                            username = text!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        //是否显示密码类型
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: validatePassword,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: '请输入密码',
                            hintText: '密码'),
                        onSaved: (text) {
                          setState(() {
                            password = text!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Offstage(
                        offstage: visible,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                labelText: '请确认密码',
                              ),
                              validator: visible ? null : validateRePassword,
                              onSaved: (text) {
                                setState(() {
                                  rePassword = text!;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("lib/res/images/pig.jpg"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      //左右、上下阴影的距离
                      offset: Offset(0, 0),
                      //阴影颜色
                      color: Colors.grey,
                      //模糊距离
                      blurRadius: 8,
                      //不模糊距离
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 130,
            right: 130,
            child: RaisedButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              elevation: 5,
              highlightElevation: 10,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState?.save();
                  print(username + "--" + password + "**" + rePassword);
                  doRequest();
                } else {
                  setState(() {
                    autoValidate = true;
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColorDark,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  btnText,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ]),
        GestureDetector(
          child: Text(
            bottomText,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            setState(() {
              if (visible) {
                btnText = "注册";
                visible = false;
                bottomText = "已有账号？登录";
              } else {
                btnText = "登录";
                visible = true;
                bottomText = "没有账号？注册";
              }
            });
          },
        ),
      ],
    );
  }

  String? validateUsername(String? value) {
    if (null == value) {
      return null;
    }
    if (value.isEmpty) {
      return "账号不能为空";
    } else if (value.length < 6) {
      return "账号最少6位";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (null == value) {
      return null;
    }
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.length < 6) {
      return "密码最少6位";
    }
    return null;
  }

  String? validateRePassword(String? value) {
    if (null == value) {
      return null;
    }
    if (value.isEmpty) {
      return "确认密码不能为空";
    } else if (value.length < 6) {
      return "确认密码最少6位";
    }
    return null;
  }

  Future doRequest() async {
    Map<String, String> data;
    if (visible) {
      data = {'username': username, 'password': password};
    } else {
      data = {
        'username': username,
        'password': password,
        'repassword': rePassword
      };
    }

    var response =
        await HttpUtil().post(visible ? Api.LOGIN : Api.REGISTER, data: data);
    Map<String, dynamic> userMap = json.decode(response.toString());
    var userEntity = UserEntity.fromJson(userMap);
    if (userEntity.errorCode == 0) {
      Provider.of<UserInfo>(context, listen: false).setUserInfo(userEntity);

      SpUtil.putObject("user", userEntity);
      SpUtil.putBool("login", true);
      Fluttertoast.showToast(msg: visible ? "登录成功~" : "注册成功~");
      //跳转并关闭当前页面
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: "首页",
                )),
        (route) => route == null,
      );
    } else {
      Fluttertoast.showToast(msg: userMap['errorMsg']);
    }
  }
}
