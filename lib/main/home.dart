import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/article_entity.dart';
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
  int _page = 0;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  List<BannerData> bannerData = [];
  List<ArticleDataData> articleDatas = [];

  void getHttp() async {
    try {
      //banner
      var bannerResponse = await HttpUtil().get(Api.BANNER);
      Map<String, dynamic> bannerMap = json.decode(bannerResponse.toString());
      var bannerEntity = BannerEntity.fromJson(bannerMap);

      //article
      var articleResponse =
          await HttpUtil().get(Api.ARTICLE_LIST + "$_page/json");
      Map<String, dynamic> articleMap = json.decode(articleResponse.toString());
      var articleEntity = ArticleEntity.fromJson(articleMap);
      print(articleEntity);

      setState(() {
        bannerData = bannerEntity.data!;
        articleDatas = articleEntity.data!.datas;
      });

      // _swiperController.startAutoplay();
    } catch (e) {
      print(e);
    }
  }

  Future getMoreData() async {
    var response = await HttpUtil().get(Api.ARTICLE_LIST + "$_page/json");
    Map<String, dynamic> map = json.decode(response.toString());
    var articleEntity = ArticleEntity.fromJson(map);
    setState(() {
      articleDatas.addAll(articleEntity.data!.datas);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("---------build-------");
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                // margin: EdgeInsets.fromLTRB(0, 300.h, 0, 0),
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height - 300.h,
                // color: Colors.lightGreenAccent,
                child: EasyRefresh(
              header: ClassicalHeader(
                refreshText: "下拉刷新",
                refreshReadyText: "松开后开始刷新",
                refreshingText: "正在刷新...",
                refreshedText: "刷新完成",
                bgColor: Colors.transparent,
                textColor: Colors.black87,
                infoText: '更新于 %T',
              ),
              footer: ClassicalFooter(
                  loadText: "上拉加载更多",
                  loadReadyText: "松开后开始加载",
                  loadingText: "正在加载...",
                  loadedText: "加载完成",
                  noMoreText: "没有更多内容了",
                  bgColor: Colors.transparent,
                  textColor: Colors.black87,
                  infoText: '更新于 %T'),
              child: ListView.builder(
                  itemCount: articleDatas.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return bannerItem();
                    }
                    return buildListItem(index, articleDatas[index - 1]);
                  }),
              onRefresh: () async {
                getHttp();
                setState(() {
                  _page = 0;
                });
              },
              onLoad: () async {
                await Future.delayed(const Duration(seconds: 1), () async {
                  setState(() {
                    _page++;
                  });
                  getMoreData();
                });
              },
            ))
          ],
        ),
      ),
    );
  }

  /*
  * child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  buildListItem(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 800.h,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 800.h,
                    color: Colors.blue,
                  ),
                ],
              ),
  * */

  void clickArticle(ArticleDataData article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Browser(title: article.title!, url: article.link!),
      ),
    );
  }

  Widget buildListItem(int index, ArticleDataData article) {
    return InkWell(
      onTap: () {
        clickArticle(article);
      },
      child: SizedBox(
        height: 180.h,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  // color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            article.title!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border,
                            size: 25,
                            color: Colors.black12,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: const Icon(
                              Icons.access_time,
                              size: 20,
                              color: Colors.black12,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              article.niceDate!,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                checkAuthorName(article),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 140.w,
                height: 140.h,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(20.h),
                child: CircleAvatar(
                  radius: 60.w,
                  backgroundColor: getRandomColor(index),
                  child: Text(
                    article.superChapterName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
              // Image(image: NetworkImage)
            ],
          ),
        ),
      ),
    );
  }

  String checkAuthorName(ArticleDataData article) {
    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser == null || article.shareUser!.isEmpty) {
        return article.chapterName!;
      } else {
        return article.shareUser!;
      }
    }
    return article.author!;
  }

  Color? getRandomColor(int index) {
    // var rng = Random(); //随机数生成类
    // var randomValue = rng.nextInt(4); //0-3
    var randomValue = index % 4; //0-3
    switch (randomValue) {
      case 0:
        return Colors.purpleAccent;
      case 1:
        return Colors.blueAccent;
      case 2:
        return Colors.deepPurpleAccent;
      case 3:
        return Colors.lightBlue;
    }
    return Colors.deepOrangeAccent;
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
      // Fluttertoast.showToast(msg: '$index');
      print("---------click index : ${bannerData[index].url}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Browser(
              title: bannerData[index].title!, url: bannerData[index].url!),
        ),
      );
    }
  }
}
