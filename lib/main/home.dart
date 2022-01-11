import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

//项目首页
class homePage extends StatefulWidget {
  const homePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "http://via.placeholder.com/350x150",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                autoplayDelay: 4000,
                autoplay: true,
                pagination: const SwiperPagination(), //indicator
                // control: const SwiperControl(), //控制按钮
              ),
            )
          ],
        ),
      ),
    );
  }
}
