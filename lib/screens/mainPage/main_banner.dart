import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:iea/screens/splashPage/webView.dart';

class MainBanner extends StatefulWidget {
  final List<IndexOpenCourseModel> indexBannerList;
  MainBanner({Key key, @required this.indexBannerList}) : super(key: key);
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> 
with AutomaticKeepAliveClientMixin<MainBanner>
{
  @override
  bool get wantKeepAlive => true;

  @override 
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      child: IndexSwiper(indexBannerList: widget.indexBannerList),
    );
  }
}

class IndexSwiper extends StatefulWidget {
  final List<IndexOpenCourseModel> indexBannerList;
  IndexSwiper({Key key, @required this.indexBannerList}) : super(key: key);
  _IndexSwiperState createState() => _IndexSwiperState();
}
class _IndexSwiperState extends State<IndexSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      scrollDirection: Axis.horizontal, // 横向
      itemCount: widget.indexBannerList.length,// 数量
      autoplay: true,// 自动翻页
      itemBuilder: (BuildContext context, int index) {// 构建
        return Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 17.0),
          child: AspectRatio(
            aspectRatio: 10.0 / 3.46,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ExtendedImage.network(
                widget.indexBannerList[index].picture,
                cache: true,
                enableLoadState: false,
                fit: BoxFit.fill
              )
            )
          ),
        );
      },
      onTap: (index) {
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return WebViewPage(url: widget.indexBannerList[index].linkUrl);
        }));
      },// 点击事件 onTap
      pagination: SwiperPagination( // 分页指示器
          alignment: Alignment.bottomCenter,// 位置 Alignment.bottomCenter 底部中间
          builder: DotSwiperPaginationBuilder(
            activeColor: Color.fromRGBO(255, 255, 255, 0.51),
            color: Colors.white
        )) // 两张图片之间的间隔
    );
  }
}