import 'package:flutter/material.dart';
class ConsultAndPlay extends StatefulWidget {
  final bool isBuied;
  ConsultAndPlay({Key key, @required this.isBuied}) : super(key: key);
  _ConsultAndPlayState createState() => _ConsultAndPlayState();
}

class _ConsultAndPlayState extends State<ConsultAndPlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isBuied
      ? Row(
        children: <Widget>[
          Container(
            height: 52,
            width: 85,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/openDetail/course_consult.png', width: 25, height: 21,),
                Text('咨询', style: TextStyle(fontSize: 12, color: Color.fromRGBO(51, 51, 51, 1)))
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 52,
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 110, 34, 1)
              ),
              child: Text('开始学习',  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500))
            ),
          )
        ],
      )
      : Row(
        children: <Widget>[
          Container(
            width: 193,
            height: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Image.asset('assets/images/openDetail/timeFree.png', width: 49, height: 14, fit: BoxFit.cover,),
                ),
                Container(margin: EdgeInsets.only(left: 5), child: Text('￥1657', style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),)
              ],
            ),
          ),
          Container(
            width: 62,
            height: 52,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 148, 86, 1)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Image.asset('assets/images/openDetail/consult.png', width: 25, height: 21, fit: BoxFit.cover,),
                ),
                Text('咨询', style: TextStyle(fontSize: 12, color: Colors.white))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 110, 34, 1)
              ),
              child: Text('立即报名', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}