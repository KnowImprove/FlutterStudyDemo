import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_github/page/login_page.dart';
import 'package:flutter_study_github/page/search_page.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import './main/home.dart';
import './main/mine.dart';
import './main/native_to_flutter.dart';
import './main/project.dart';
import './main/wx_account.dart';
import 'common/api.dart';
import 'http/httpUtil.dart';
import 'model/user_entity.dart';
import 'model/userinfo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();

  runApp(ChangeNotifierProvider(
    create: (ctx) => UserInfo(null),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '首页'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<String> _widgetTitle = <String>[
    '首页',
    '公众号',
    '项目',
    '交互',
    '我的'
  ];

  List<Widget> _widgetOptions = [];

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomePage(title: '首页'),
  //   WxPage(title: '公众号'),
  //   ProjectPage(title: '项目'),
  //   NativePage(title: '交互'),
  //   MinePage(title: '我的')
  // ];

  @override
  void initState() {
    super.initState();
    _widgetOptions
      ..add(const HomePage(title: '首页'))
      ..add(const WxPage(title: '公众号'))
      ..add(const ProjectPage(title: '项目'))
      ..add(const NativePage(title: '交互'))
      ..add(const MinePage(title: '我的'));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(720, 1280),
        minTextAdapt: true,
        orientation: Orientation.portrait);

    //收到userEntity改变会刷新页面
    Provider.of<UserInfo>(context).userEntity;

    // bool? isLogin = SpUtil.getBool("login", defValue: false);
    UserEntity? userEntityNew =
        SpUtil.getObj("user", (v) => UserEntity.fromJsonPro(v));
    bool isLogin = false;
    if (null == userEntityNew || null == userEntityNew.data) {
      isLogin = false;
    } else {
      isLogin = true;
    }

    if (kDebugMode) {
      print(widget);
    }
    return Scaffold(
      appBar: _selectIndex == 4
          ? null
          : AppBar(
              elevation: 0,
              leading: _selectIndex != 0
                  ? null
                  : InkWell(
                      onTap: () {
                        bool? isLogin =
                            SpUtil.getBool("login", defValue: false);
                        if (null == isLogin || !isLogin) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          _alertDialog();
                        }
                      },
                      child: checkLoginIcon(isLogin),
                    ),
              actions: [
                InkWell(
                  onTap: () {
                    // Fluttertoast.showToast(msg: "搜索");
                    jumpSearch();
                  },
                  child: Container(
                    // margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              title: Text(_widgetTitle.elementAt(_selectIndex)),
              centerTitle: true,
            ),
      body: Center(
        child: IndexedStack(
          index: _selectIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_railway_rounded),
              label: "公众号",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment_rounded),
              label: "项目",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              label: "交互",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.near_me),
              label: "我的",
            )
          ],
          currentIndex: _selectIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void jumpSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Search(),
      ),
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

  Widget checkLoginIcon(bool isLogin) {
    if (isLogin) {
      return Center(
        child: ClipOval(
          child: Image.asset(
            'lib/res/images/pig.jpg',
            width: 30,
            height: 30,
          ),
        ),
      );
    } else {
      return const Icon(
        Icons.person,
        size: 25,
        color: Colors.white,
      );
    }
  }

  void onItemTapped(int index) {
    if (kDebugMode) {
      print('index = $index');
    }
    setState(() {
      _selectIndex = index;
    });
  }
}
