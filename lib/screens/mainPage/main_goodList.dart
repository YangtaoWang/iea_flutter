import 'package:flutter/material.dart';
// import 'package:iea/blocs/indexPage_blocs/index_goodCourse_bloc.dart';
import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/widgets/error.dart';
// import 'package:iea/widgets/loading.dart';
import 'package:extended_image/extended_image.dart';
class MainGoodList extends StatefulWidget {
  final List<IndexGoodCourseModel> indexMenuClassList;
  MainGoodList({Key key, @required this.indexMenuClassList}) : super(key: key);
  _MainGoodListState createState() => _MainGoodListState();
}

class _MainGoodListState extends State<MainGoodList> with AutomaticKeepAliveClientMixin<MainGoodList>{
  @override
  bool get wantKeepAlive => true;
  // IndexMenuClassListBloc _bloc = new IndexMenuClassListBloc();
  // List<IndexGoodCourseModel> indexMenuClassList = [];
  //   _getGoodList() {
  //   _bloc.indexMenuClassList();
  // }
  @override
  void initState() {
    super.initState();
    // _getGoodList();
  }
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<BaseResp>(
    //   stream: _bloc.indexMenuClassListStream,
    //   builder: (context, AsyncSnapshot<BaseResp> snapshot) {
    //     if (snapshot.data != null && snapshot.hasData) {
    //       var response = snapshot.data;
    //       if (response.result == true && response.data != null) {
    //         indexMenuClassList = snapshot.data.data;
    //         return Container(
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 17),
    //               child: Column(
    //                 children: <Widget>[
    //                   Container(
    //                     height: 60,
    //                     alignment: FractionalOffset.centerLeft,
    //                     child: Text('精品好课试听', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500)),
    //                     ),
    //                     Container(
    //                       height: 118,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                           image: NetworkImage(indexMenuClassList[0].bannerUrl),
    //                           fit: BoxFit.fill
    //                         ),
    //                         borderRadius: BorderRadius.circular(8)
    //                       ),
    //                     ),
    //                     Container(
    //                       child: ListView.builder(
    //                         scrollDirection: Axis.vertical,
    //                         physics: new NeverScrollableScrollPhysics(),
    //                         shrinkWrap: true,
    //                         itemBuilder: (BuildContext context, int index) {
    //                           return Container(
    //                             decoration: BoxDecoration(
    //                               border: Border(bottom: index != indexMenuClassList.length - 1 ? BorderSide(width: 1, color: Color.fromRGBO(236, 236, 236, 1)) : BorderSide.none),
    //                             ),
    //                             child: Container(
    //                               margin: EdgeInsets.symmetric(vertical: 17),
    //                               child: Row(
    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                 children: <Widget>[
    //                                   Container(
    //                                     width: 149,
    //                                     height: 81,
    //                                     margin: EdgeInsets.only(right: 16),
    //                                     decoration: BoxDecoration(
    //                                       image: DecorationImage(
    //                                         image: NetworkImage(indexMenuClassList[index].gdCover),
    //                                         fit: BoxFit.fill
    //                                       ),
    //                                       borderRadius: BorderRadius.circular(4)
    //                                     ),
    //                                   ),
    //                                   Expanded(
    //                                     flex: 1,
    //                                     child: Container(
    //                                       child: Column(
    //                                         crossAxisAlignment: CrossAxisAlignment.start,
    //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                         children: <Widget>[
    //                                           Container(
    //                                             child: Text(indexMenuClassList[index].goName, style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500), maxLines: 2),
    //                                           ),
    //                                           Text.rich(TextSpan(children: <TextSpan>[
    //                                             TextSpan(
    //                                               text: indexMenuClassList[index].discountPrice == null ? '￥' + indexMenuClassList[index].price + '   ' : '￥' + indexMenuClassList[index].discountPrice + '   ',
    //                                               style: TextStyle(color: Color.fromRGBO(254, 100, 0, 1), fontSize: 15, fontWeight: FontWeight.w500)
    //                                             ),
    //                                             TextSpan(
    //                                               text: indexMenuClassList[index].discountPrice == null ? '' : '￥' + indexMenuClassList[index].price,
    //                                               style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 15, fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough)
    //                                             )
    //                                           ]))
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                             )
    //                         );
    //                       },
    //                       itemCount: indexMenuClassList.length
    //                     ),
    //                   )
    //               ],
    //             ),
    //           ),
    //         );
    //       } else {
    //         return ErrorPage();
    //       }
    //     } else {
    //       return LoadingPage();
    //     }
    //   }
    // );
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                alignment: FractionalOffset.centerLeft,
                child: Text('精品好课试听', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500)),
                ),
                Container(
                  child: AspectRatio(
                    aspectRatio: 10.0 / 3.46,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ExtendedImage.network(
                        widget.indexMenuClassList[0].bannerUrl,
                        cache: true,
                        enableLoadState: false,
                        fit: BoxFit.fill
                      )
                    )
                  )
                ),
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: new NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: index != widget.indexMenuClassList.length - 1 ? BorderSide(width: 1, color: Color.fromRGBO(236, 236, 236, 1)) : BorderSide.none),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: AspectRatio(
                                  aspectRatio: 10.0 / 5.44,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: ExtendedImage.network(
                                      widget.indexMenuClassList[index].gdCover,
                                      cache: true,
                                      enableLoadState: false,
                                      fit: BoxFit.fill
                                    )
                                  )
                                ),
                                width: 149,
                                margin: EdgeInsets.only(right: 16)
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text(widget.indexMenuClassList[index].goName, style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500), maxLines: 2),
                                      ),
                                      Text.rich(TextSpan(children: <TextSpan>[
                                        TextSpan(
                                          text: widget.indexMenuClassList[index].discountPrice == null ? '￥' + widget.indexMenuClassList[index].price + '   ' : '￥' + widget.indexMenuClassList[index].discountPrice + '   ',
                                          style: TextStyle(color: Color.fromRGBO(254, 100, 0, 1), fontSize: 15, fontWeight: FontWeight.w500)
                                        ),
                                        TextSpan(
                                          text: widget.indexMenuClassList[index].discountPrice == null ? '' : '￥' + widget.indexMenuClassList[index].price,
                                          style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 15, fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough)
                                        )
                                      ]))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    );
                  },
                  itemCount: widget.indexMenuClassList.length
                ),
              )
          ],
        ),
      ),
    );
  }
}