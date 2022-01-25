import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/banner_entity.dart';
import '../page/webview_brower.dart';

//项目首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  List<BannerData> bannerData = [];

  void getHttp() async {
    try {
      //banner
      var bannerResponse = await HttpUtil().get(Api.BANNER);
      Map<String, dynamic> bannerMap = json.decode(bannerResponse.toString());
      var bannerEntity = BannerEntity.fromJson(bannerMap);

      //article
      // var articleResponse =
      //     await HttpUtil().get(Api.ARTICLE_LIST + "$_page/json");
      // Map articleMap = json.decode(articleResponse.toString());
      // var articleEntity = ArticleEntity.fromJson(articleMap);

      setState(() {
        bannerData = bannerEntity.data!;
        // articleDatas = articleEntity.data.datas;
      });

      // _swiperController.startAutoplay();
    } catch (e) {
      print(e);
    }
  }

  void getBannerData() async {
    // try {
    //   var response = await Dio().get('https://www.wanandroid.com/banner/json');
    //   print(response);
    //   var bannerModel =
    //       BannerModelEntity.fromJson(json.decode(response.toString()));
    //   setState(() {
    //     bannerData = bannerModel.data!;
    //   });
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("---------build-------");
    }
    return Scaffold(
      body: Container(
        child: Row(
          children: [bannerItem()],
        ),
      ),
    );
  }

  Widget bannerItem() {
    if (kDebugMode) {
      print("bannerData.isEmpty = ${bannerData.isEmpty}");
    }
    if (bannerData.isEmpty) {
      return Container(
        color: Colors.black12,
        width: MediaQuery.of(context).size.width,
        height: 320.h,
        alignment: Alignment.center,
        child: const Text(
          "正在加载数据···",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),
        ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 320.h,
      child: Container(
        child: Swiper(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              bannerData.elementAt(index).imagePath!,
              fit: BoxFit.fill,
            );
          },
          itemCount: bannerData.length,
          autoplayDelay: 2000,
          autoplay: bannerData.isNotEmpty,
          onTap: clickBanner,
          pagination: const SwiperPagination(), //indicator
          // control: const SwiperControl(), //控制按钮
        ),
      ),
    );
  }

  void clickBanner(int index) {
    if (bannerData.isNotEmpty) {
      print("---------click index : ${bannerData[index].url}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Browser(
              title: bannerData[index].title!, url: bannerData[index].url!),
        ),
      );
    }
    // Fluttertoast.showToast(msg: '$index');
  }
}
