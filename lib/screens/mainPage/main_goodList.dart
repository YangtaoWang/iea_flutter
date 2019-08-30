import 'package:flutter/material.dart';
import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';
import 'package:extended_image/extended_image.dart';
class MainGoodList extends StatefulWidget {
  final List<IndexGoodCourseModel> indexMenuClassList;
  MainGoodList({Key key, @required this.indexMenuClassList}) : super(key: key);
  _MainGoodListState createState() => _MainGoodListState();
}

class _MainGoodListState extends State<MainGoodList> with AutomaticKeepAliveClientMixin<MainGoodList>{
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: <Widget>[
                Container(
                height: 60,
                alignment: FractionalOffset.centerLeft,
                child: Text('IEA认证项目', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500)),
                ),
                widget.indexMenuClassList[0].bannerUrl == null || widget.indexMenuClassList[0].bannerUrl == '' ? Container() :
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