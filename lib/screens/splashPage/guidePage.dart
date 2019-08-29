import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:extended_image/extended_image.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key key}) : super(key: key);

  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: GuideSwiper()
      ),
    );
  }
}

class GuideSwiper extends StatefulWidget {
  final List<String> guideList = ['assets/images/splashPage/guide1.jpeg', 'assets/images/splashPage/guide2.jpeg', 'assets/images/splashPage/guide3.jpg'];
  GuideSwiper({Key key}) : super(key: key);
  _GuideSwiperState createState() => _GuideSwiperState();
}
class _GuideSwiperState extends State<GuideSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      scrollDirection: Axis.horizontal, // 横向
      itemCount: widget.guideList.length,// 数量
      autoplay: false,// 自动翻页
      loop: false,
      itemBuilder: (BuildContext context, int index) {// 构建
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(widget.guideList[index], fit: BoxFit.cover),
          // child: AspectRatio(
          //   aspectRatio: 10.0 / 3.46,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8.0),
          //     child: ExtendedImage.assets(
          //       widget.guideList[index],
          //       cache: true,
          //       enableLoadState: false,
          //       fit: BoxFit.fill
          //     )
          //   )
          // ),
        );
      },
      onTap: (index) {
        if (index == 2) {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => route == null);
        }
      },// 点击事件 onTap
      pagination: SwiperPagination( // 分页指示器
          alignment: Alignment.bottomCenter,// 位置 Alignment.bottomCenter 底部中间
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Color.fromRGBO(255, 255, 255, 0.51)
            
        )) // 两张图片之间的间隔
    );
  }
}