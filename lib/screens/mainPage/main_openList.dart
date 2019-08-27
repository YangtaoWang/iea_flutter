import 'package:flutter/material.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:extended_image/extended_image.dart';

class MainOpenList extends StatefulWidget {
  final List<IndexOpenClassModel> openClassList;
  MainOpenList({Key key, @required this.openClassList}) : super(key: key);

  _MainOpenListState createState() => _MainOpenListState();
}

class _MainOpenListState extends State<MainOpenList> with AutomaticKeepAliveClientMixin<MainOpenList>{
  @override
  bool get wantKeepAlive => true;
  @override 
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                child: AspectRatio(
                  aspectRatio: 10.0 / 5.44,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ExtendedImage.network(
                      widget.openClassList[index].bannerUrl,
                      cache: true,
                      enableLoadState: false,
                      fit: BoxFit.fill
                    )
                  )
                )
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