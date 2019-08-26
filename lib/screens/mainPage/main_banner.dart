import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:iea/blocs/indexPage_blocs/index_openCourse_bloc.dart';
import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
import 'package:extended_image/extended_image.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/widgets/error.dart';
// import 'package:iea/widgets/loading.dart';
// import 'package:iea/provider/resource/indexpage_api_provider.dart';

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
  // List<IndexOpenCourseModel> indexBannerList;
  // GetIndexBannerListBloc _bloc = new GetIndexBannerListBloc();
  // _getIndexBanner() {
  //   Map<String, String>  params = {'type': '1'};
  //   _bloc.getIndexBannerList(params);
  // }
  // getBanner() async{
  //   Map<String, String>  params = {'type': '1'};
  //   BaseResp data = await IndexPageApiProvider().getIndexBanner(params);
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexOpenCourseModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     indexBannerList = data.data;
  //   });
  //   print(data.data);
  // }
  @override 
  void initState(){
    super.initState();
    // getBanner();
    // _getIndexBanner();
  }
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<BaseResp>(
    //   stream: _bloc.indexBannerStream,
    //   builder: (context, AsyncSnapshot<BaseResp> snapshot) {
    //    if (snapshot.data != null && snapshot.hasData) {
    //       var response = snapshot.data;
    //       if (response.result == true && response.data != null) {
    //         indexBannerList = response.data;
    //         return Container(
    //           height: 118,
    //           child: IndexSwiper(indexBannerList: indexBannerList),
    //         );
    //       } else {
    //         return ErrorPage();
    //       }
    //     } else {
    //       return LoadingPage();
    //     }
    //   }
    // );
    // if(indexBannerList == null) {
    //   return LoadingPage();
    // } else {
    //   return Container(
    //     height: 118,
    //     child: IndexSwiper(indexBannerList: indexBannerList),
    //   );
    // }
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
      onTap: (index) {print(index);},// 点击事件 onTap
      pagination: SwiperPagination( // 分页指示器
          alignment: Alignment.bottomCenter,// 位置 Alignment.bottomCenter 底部中间
          builder: DotSwiperPaginationBuilder(
            activeColor: Color.fromRGBO(255, 255, 255, 0.51),
            color: Colors.white
        )) // 两张图片之间的间隔
    );
  }
}