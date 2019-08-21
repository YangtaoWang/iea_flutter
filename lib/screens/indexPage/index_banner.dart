import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/indexPage_blocs/index_openCourse_bloc.dart';
import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
class Indexbanner extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => _IndexbannerState();
}
class _IndexbannerState extends State<Indexbanner>
  with AutomaticKeepAliveClientMixin<Indexbanner> {
  @override
  bool get wantKeepAlive => true;
  GetIndexBannerListBloc _bloc = new GetIndexBannerListBloc();
  List<IndexOpenCourseModel> indexBannerList = [];
   _getIndexBanner() {
    Map<String, String>  params = {'type': '1'};
    _bloc.getIndexBannerList(params);
  }
    @override
  void initState() {
    super.initState();
    _getIndexBanner();
  }
  @override 
  Widget build(BuildContext context){
    return StreamBuilder<BaseResp>(
      stream: _bloc.indexBannerStream,
      builder: (context, AsyncSnapshot<BaseResp> snapshot) {
       if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            indexBannerList = snapshot.data.data;
            return Container(
              width: 375.0,
              height: 122.0,
              child: Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 17.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(indexBannerList[index].picture),
                        fit: BoxFit.fill,
                      )
                    ),
                  );
                },
                itemCount: indexBannerList.length,
                pagination: SwiperPagination(
                  margin: EdgeInsets.only(bottom: 10.0,),
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.blue[600],
                    activeColor: Colors.white,
                    space: 5,
                  ),
                ),
                onTap: (index) {
                  debugPrint("点击了第:$index个");
                  Navigator.pushNamed(context, '/play');
                },
                // itemWidth: 375.0,
                // itemHeight: 122.0,
                // scrollDirection: Axis.vertical,
                // control: new SwiperControl(),
              ),
            );
          } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      }
    );
  }
}