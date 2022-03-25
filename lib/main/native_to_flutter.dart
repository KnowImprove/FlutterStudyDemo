import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//与原生交互测试相关页面
class NativePage extends StatefulWidget {
  const NativePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NativePageState createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  static const channel = MethodChannel("flutter_native_channel");

  static const channelFromNative = MethodChannel("channel_call_flutter");

  @override
  void initState() {
    super.initState();
    channelFromNative.setMethodCallHandler((call) {
      print(call.method);
      switch (call.method) {
        case "channel_call_flutter":
          {
            String result = call.arguments['msg'];
            print("Native 调用 Flutter 成功，参数是：$result");
            return Future.value("执行结果:Native 调用 Flutter 成功，参数是：$result");
          }
      }
      return Future.value("执行结束");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Future future = channel.invokeMethod("flutter_native_channel",
                    {"type": "toast", "content": "我是原生调用显示的"});
                print(future.toString());
              },
              child: const Text("调用原生toast")),
          ElevatedButton(
              onPressed: () {
                Future future = channel.invokeMethod(
                    "flutter_native_channel", {"type": "versionCode"});
                future.then((value) => {print(value)});
              },
              child: const Text("获取版本号")),
          ElevatedButton(
              onPressed: () {
                Future future = channel
                    .invokeMethod("flutter_native_channel", {"type": "jump"});
                future.then((value) => {print(value)});
              },
              child: const Text("跳转原生界面")),
        ],
      ),
    );
  }
}
