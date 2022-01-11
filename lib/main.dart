import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './main/home.dart';
import './main/mine.dart';
import './main/native_to_flutter.dart';
import './main/project.dart';
import './main/wx_account.dart';

void main() {
  runApp(const MyApp());
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

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(title: '首页'),
    wxPage(title: '公众号'),
    projectPage(title: '项目'),
    nativePage(title: '交互'),
    minePage(title: '我的')
  ];

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetTitle.elementAt(_selectIndex)),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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

  void onItemTapped(int index) {
    if (kDebugMode) {
      print('index = $index');
    }
    setState(() {
      _selectIndex = index;
    });
  }
}
