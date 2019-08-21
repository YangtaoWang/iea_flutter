import 'package:flutter/material.dart';
// import 'index_banner.dart';
import 'index_openCourse.dart';
// import 'index_openClass.dart';
// import 'index_goodCourse.dart';
class IndexPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}
class _IndexPageState extends State<IndexPage>
  with AutomaticKeepAliveClientMixin<IndexPage> {
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context){
    return ListView(
      padding: EdgeInsets.only(top: 20),
      physics: ScrollPhysics(),
      children: <Widget>[
        // Indexbanner(),
        OpenCourse(),
        // IndexOpenClass(),
        // GoodCourse(),
      ],
    );
  }
}