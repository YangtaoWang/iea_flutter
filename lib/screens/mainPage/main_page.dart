import 'package:flutter/material.dart';
import 'main_banner.dart';
import 'main_goodList.dart';
import 'main_openBanner.dart';
import 'main_openList.dart';
// import 'package:iea/provider/resource/indexpage_api_provider.dart';
// import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
// import 'package:iea/models/indexPage_models/index_openClass_model.dart';
// import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'dart:async';
import 'package:iea/widgets/loading.dart';
import 'package:iea/blocs/indexPage_blocs/index_allData.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin<MainPage> {
  @override
  bool get wantKeepAlive => true;

  // List<IndexOpenCourseModel> indexBannerList;
  // List<IndexOpenClassModel> openClassBanner;
  // List<IndexOpenClassModel> openClassList;
  // List<IndexGoodCourseModel> goodClassList;

  // Future<List<IndexOpenCourseModel>> _getBanner() async{
  //   Map<String, String>  params = {'type': '1'};
  //   BaseResp data = await IndexPageApiProvider().getIndexBanner(params);
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexOpenCourseModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     indexBannerList = data.data;
  //   });
  //   return data.data;
  // }
  // Future<List<IndexOpenClassModel>> _getOpenBanner() async{
  //   Map<String, String>  params = {'type': '1'};
  //   BaseResp data = await IndexPageApiProvider().openClassList(params);
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexOpenClassModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     openClassBanner = data.data;
  //   });
  //   return data.data;
  // }
  // Future<List<IndexOpenClassModel>> _getOpenList() async{
  //   Map<String, String>  params = {'type': '2'};
  //   BaseResp data = await IndexPageApiProvider().openClassList(params);
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexOpenClassModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     openClassList = data.data;
  //   });
  //   return data.data;
  // }
  // Future<List<IndexGoodCourseModel>> _getGoodList() async{
  //   BaseResp data = await IndexPageApiProvider().indexMenuClassList();
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexGoodCourseModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     goodClassList = data.data;
  //   });
  //   return data.data;
  // }
  // _getAll() async {
  //   List res = await Future.wait([_getBanner(), _getOpenBanner(), _getOpenList(), _getGoodList()]);
  //   setState(() {
  //     indexBannerList = res[0];
  //     openClassBanner = res[1];
  //     openClassList = res[2];
  //     goodClassList = res[3];
  //   });
  // }
  IndexAllBloc _bloc = new IndexAllBloc();
  @override
  void initState() {
    // _getAll();
    // _getBanner();
    // _getOpenBanner();
    // _getOpenList();
    // _getGoodList();
    _bloc.getAllData();
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (indexBannerList == null || openClassBanner == null || openClassList == null || goodClassList == null) {
  //     return LoadingPage();
  //   } else {
  //     return Container(
  //       child: ListView(
  //         shrinkWrap: true,
  //         children: <Widget>[
  //           MainBanner(indexBannerList: indexBannerList),
  //           MainOpenBanner(openClassList: openClassBanner),
  //           MainOpenList(openClassList: openClassList),
  //           MainGoodList(indexMenuClassList: goodClassList)
  //         ],
  //       )
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.getAllDataStream,
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.data != null && snapshot.hasData){
          return Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                snapshot.data[0].length != 0 ? MainBanner(indexBannerList: snapshot.data[0]) : Container(),
                snapshot.data[1].length != 0 ? MainOpenBanner(openClassList: snapshot.data[1]) : Container(),
                snapshot.data[2].length != 0 ? MainOpenList(openClassList: snapshot.data[2]) : Container() ,
                snapshot.data[3].length != 0 ? MainGoodList(indexMenuClassList: snapshot.data[3]) : Container()
              ],
            )
          );
        } else {
          return LoadingPage();
        }
      }
    );
  }
}