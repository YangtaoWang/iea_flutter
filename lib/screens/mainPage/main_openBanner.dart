import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:iea/blocs/indexPage_blocs/index_openClass_bloc.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/widgets/error.dart';
// import 'package:iea/widgets/loading.dart';
// import 'package:iea/provider/resource/indexpage_api_provider.dart';

class MainOpenBanner extends StatefulWidget {
  final List<IndexOpenClassModel> openClassList;
  MainOpenBanner({Key key, @required this.openClassList}) : super(key: key);

  _MainOpenBannerState createState() => _MainOpenBannerState();
}

class _MainOpenBannerState extends State<MainOpenBanner> with AutomaticKeepAliveClientMixin<MainOpenBanner>{
  @override
  bool get wantKeepAlive => true;
  // GetopenClassListBloc _bloc = new GetopenClassListBloc();
  // List<IndexOpenClassModel> openClassList;
  //  _getOpenBanner() {
  //   Map<String, String>  params = {'type': '1'};
  //   _bloc.getopenClassList(params);
  // }
  // getOpenBanner() async {
  //   Map<String, String>  params = {'type': '1'};
  //   BaseResp data = await IndexPageApiProvider().openClassList(params);
  //   if (data.result) {
  //     data.data = (data.data as List).map((value) => IndexOpenClassModel.fromJson(value)).toList();
  //   }
  //   setState(() {
  //     openClassList = data.data;
  //   });
  // }
  @override 
  void initState() {
    // _getOpenBanner();
    // getOpenBanner();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<BaseResp>(
    //   stream: _bloc.getopenClassListStream,
    //   builder: (context, AsyncSnapshot<BaseResp> snapshot) {
    //    if (snapshot.data != null && snapshot.hasData) {
    //       var response = snapshot.data;
    //       if (response.result == true && response.data != null) {
    //         openClassList = response.data;
    //         return Container(
    //           child: Column(
    //             children: <Widget>[
    //               Padding(
    //                 padding: EdgeInsets.only(left: 17),
    //                 child: Container(
    //                   height: 51,
    //                   alignment: FractionalOffset.centerLeft,
    //                   child: Text('公开课', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500),)
    //                 )
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(horizontal: 17),
    //                 child: Container(
    //                   height: 158,
    //                   decoration: BoxDecoration(
    //                     image: DecorationImage(
    //                       image: NetworkImage(openClassList[0].bannerUrl),
    //                       fit: BoxFit.fill
    //                     ),
    //                     borderRadius: BorderRadius.circular(8)
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         );
    //         } else {
    //         return ErrorPage();
    //       }
    //     } else {
    //       return LoadingPage();
    //     }
    //   }
    // );
    // if (openClassList == null) {
    //   return LoadingPage();
    // } else {
    //   return Container(
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: EdgeInsets.only(left: 17),
    //           child: Container(
    //             height: 51,
    //             alignment: FractionalOffset.centerLeft,
    //             child: Text('公开课', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500),)
    //           )
    //         ),
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 17),
    //           child: Container(
    //             height: 158,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: NetworkImage(openClassList[0].bannerUrl),
    //                 fit: BoxFit.fill
    //               ),
    //               borderRadius: BorderRadius.circular(8)
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: Container(
              height: 51,
              alignment: FractionalOffset.centerLeft,
              child: Text('公开课', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500),)
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              height: 158,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.openClassList[0].bannerUrl),
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
          )
        ],
      ),
    );
  }
}