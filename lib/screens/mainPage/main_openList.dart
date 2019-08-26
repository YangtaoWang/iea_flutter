import 'package:flutter/material.dart';
// import 'package:iea/blocs/indexPage_blocs/index_openClass_bloc.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
// import 'package:iea/provider/resource/indexpage_api_provider.dart';

class MainOpenList extends StatefulWidget {
  final List<IndexOpenClassModel> openClassList;
  MainOpenList({Key key, @required this.openClassList}) : super(key: key);

  _MainOpenListState createState() => _MainOpenListState();
}

class _MainOpenListState extends State<MainOpenList> with AutomaticKeepAliveClientMixin<MainOpenList>{
  @override
  bool get wantKeepAlive => true;
  // List<IndexOpenClassModel> openClassList;
  // GetopenClassListBloc _bloc = new GetopenClassListBloc();
  // _getOpenList() {
  //   Map<String, String>  params = {'type': '2'};
  //   _bloc.getopenClassList(params);
  // }
  // getOpenList() async {
  //   Map<String, String>  params = {'type': '2'};
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
    // _getOpenList();
    // getOpenList();
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
    //         return Container(
    //           margin: EdgeInsets.only(top: 19),
    //           child: Column(
    //             children: <Widget>[
    //               Container(
    //                 height: 110,
    //                 child: OpenListView(openClassList: response.data)
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 24),
    //                 height: 10,
    //                 decoration: BoxDecoration(
    //                   color: Color.fromRGBO(247, 247, 247, 1)
    //                 ),
    //               )
    //             ],
    //           ),
    //         );
    //       } else {
    //           return ErrorPage();
    //       }
    //     } else {
    //         return LoadingPage();
    //     }
    //   }
    // );
    // if (openClassList == null) {
    //   return LoadingPage();
    // } else {
    //   return Container(
    //     margin: EdgeInsets.only(top: 19),
    //     child: Column(
    //       children: <Widget>[
    //         Container(
    //           height: 110,
    //           child: OpenListView(openClassList: openClassList)
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(top: 24),
    //           height: 10,
    //           decoration: BoxDecoration(
    //             color: Color.fromRGBO(247, 247, 247, 1)
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }
      return Container(
        margin: EdgeInsets.only(top: 19),
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              child: OpenListView(openClassList: widget.openClassList)
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              height: 10,
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 247, 247, 1)
              ),
            )
          ],
        ),
      );
  }
}




class OpenListView extends StatefulWidget {
  final List<IndexOpenClassModel> openClassList;
  OpenListView({Key key, @required this.openClassList}) : super(key: key);
  _OpenListViewState createState() => _OpenListViewState();
}

class _OpenListViewState extends State<OpenListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.openClassList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 115,
          margin: index != widget.openClassList.length - 1 ? EdgeInsets.only(left: 17) : EdgeInsets.only(left:17, right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 149,
                height: 81,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  image: DecorationImage(
                    image: NetworkImage(widget.openClassList[index].bannerUrl),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Container(
                width: 149,
                alignment: FractionalOffset.centerLeft,
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.openClassList[index].learnerCount + '万次  ',
                        style: TextStyle(color: Color.fromRGBO(254, 100, 0, 1), fontSize: 12, fontWeight: FontWeight.w500)
                      ),
                      TextSpan(
                        text: '正在学习',
                        style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 12, fontWeight: FontWeight.w500)
                      )
                    ]
                  ),
                )
              )
            ],
          ),
        );
      },
    );
  }
}