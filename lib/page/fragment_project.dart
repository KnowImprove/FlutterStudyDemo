import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_github/page/webview_brower.dart';

import '../common/api.dart';
import '../http/httpUtil.dart';
import '../model/project_model_item_entity.dart';

class FragmentProject extends StatefulWidget {
  int id;

  FragmentProject(this.id, {Key? key}) : super(key: key);

  @override
  _AState createState() => _AState(id);
}

class _AState extends State<FragmentProject>
    with AutomaticKeepAliveClientMixin {
  List<ProjectModelItemDataDatas>? dataVxDetails = [];

  final EasyRefreshController _controller = EasyRefreshController();

  int id;
  bool isLoading = true;
  int page = 1;
  _AState(this.id);

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var wxTabInfoResponse = await HttpUtil.getInstance()
          .get("${Api.PROJECT_LIST}$page/json?cid=$id");
      Map<String, dynamic> wxMap = json.decode(wxTabInfoResponse.toString());
      var wxTabInfoEntity = ProjectModelItemEntity.fromJson(wxMap);
      print(wxTabInfoEntity.toString());

      setState(() {
        dataVxDetails = wxTabInfoEntity.data!.datas;
      });
    } catch (e) {
      print(e);
    }
  }

  Future getMoreData() async {
    var wxTabInfoResponse = await HttpUtil.getInstance()
        .get("${Api.PROJECT_LIST}$page/json?cid=$id");
    Map<String, dynamic> wxMap = json.decode(wxTabInfoResponse.toString());
    var wxTabInfoEntity = ProjectModelItemEntity.fromJson(wxMap);

    // if (wxTabInfoEntity.data!.datas!.isEmpty) {
    //   _controller.finishLoad(success: true, noMore: true);
    // } else {
    setState(() {
      dataVxDetails!.addAll(wxTabInfoEntity.data!.datas!);
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: EasyRefresh(
            // controller: _controller,
            // enableControlFinishRefresh: true,
            // enableControlFinishLoad: true,
            header: ClassicalHeader(
              refreshText: "????????????",
              refreshReadyText: "?????????????????????",
              refreshingText: "????????????...",
              refreshedText: "????????????",
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              infoText: '????????? %T',
            ),
            footer: ClassicalFooter(
                loadText: "??????????????????",
                loadReadyText: "?????????????????????",
                loadingText: "????????????...",
                loadedText: "????????????",
                noMoreText: "?????????????????????",
                bgColor: Colors.transparent,
                textColor: Colors.black87,
                infoText: '????????? %T'),
            child: ListView.builder(
                itemCount: dataVxDetails!.length,
                itemBuilder: (context, index) {
                  return buildListItem(index, dataVxDetails![index]);
                }),
            onRefresh: () async {
              setState(() {
                page = 1;
                getHttp();
              });
            },
            onLoad: () async {
              await Future.delayed(const Duration(seconds: 1), () async {
                setState(() {
                  page++;
                  getMoreData();
                });
              });
            },
          ),
        ),
      ),
    );
  }

  void clickArticle(ProjectModelItemDataDatas article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Browser(title: article.title!, url: article.link!),
      ),
    );
  }

  Widget buildListItem(int index, ProjectModelItemDataDatas article) {
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

  Color? getRandomColor(int index) {
    // var rng = Random(); //??????????????????
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

  String checkAuthorName(ProjectModelItemDataDatas article) {
    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser == null || article.shareUser!.isEmpty) {
        return article.chapterName!;
      } else {
        return article.shareUser!;
      }
    }
    return article.author!;
  }

  @override
  bool get wantKeepAlive => true;
}
