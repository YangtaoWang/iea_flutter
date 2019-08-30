import 'package:flutter/material.dart';
import 'package:iea/screens/mainPage/main_openBanner.dart';
import 'package:iea/screens/mainPage/main_openList.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
class OpenWrap extends StatefulWidget {
  final List<IndexOpenClassModel> openClassBanner;
  final List<IndexOpenClassModel> openClassList;
  OpenWrap({Key key, @required this.openClassBanner, @required this.openClassList}) : super(key: key);
  _OpenWrapState createState() => _OpenWrapState();
}

class _OpenWrapState extends State<OpenWrap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: Column(
              children: <Widget>[
                Container(
                  height: 51,
                  alignment: FractionalOffset.centerLeft,
                  child: Text('试听课', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500),)
                ),
                MainOpenBanner(openClassList: widget.openClassBanner)
              ],
            )
          ),
          MainOpenList(openClassList: widget.openClassList, openClassBanner: widget.openClassBanner,)
        ],
      ),
    );
  }
}