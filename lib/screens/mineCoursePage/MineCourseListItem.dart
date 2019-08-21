
import 'package:flutter/material.dart';
import 'package:iea/models/mineCoursePage_models/courseList_model.dart';


class MineCourseListItem extends StatefulWidget {
  final PurchasedCourse map;

  MineCourseListItem({Key key, @required this.map}) : super(key: key);

  _MineCourseListItemState createState() => _MineCourseListItemState();
}

class _MineCourseListItemState extends State<MineCourseListItem> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:  EdgeInsets.only(left: 16, right: 16, top: 16,bottom: 34),
          color: Colors.white,
          child: Container(
            height: 81,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 左侧
              Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.tight(Size(145, 81)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: widget.map.isCourse ==2 ? NetworkImage(widget.map.gdCover) : NetworkImage(widget.map.ocCover),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    height: 22,
                    // width: 78,
                    margin: EdgeInsets.only(top: 7),
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      // color: true? Color.fromRGBO(243, 110, 34, 0.96): Color.fromRGBO(213, 213, 213, 1),
                      color: Color.fromRGBO(243, 110, 34, 0.96),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(11), bottomRight: Radius.circular(11))
                    ),
                    child: Container(
                      // constraints: BoxConstraints(maxWidth: 90,minWidth: 0),
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: widget.map.isCourse==2 ? Text(widget.map.proName ,style: TextStyle(color: Colors.white, fontSize: 12),) : Text('公开课',style: TextStyle(color: Colors.white, fontSize: 12),) ,
                      ),
                    ),
                  )
                ],
              ),
              // 右侧
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.map.isCourse==2 ? widget.map.goName : widget.map.ocName,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            hasTeacher(widget.map.isCourse == 2 , widget.map.avatarUrl),
                            Container(
                              padding: const EdgeInsets.only(left:13.0),
                              width: 110,
                              child: widget.map.isCourse !=2 ? Text( widget.map.tname, style: TextStyle(fontSize: 14,), maxLines: 1,overflow: TextOverflow.ellipsis,): Text('共'+widget.map.lessionCount+ '节', style: TextStyle(fontSize: 14,), maxLines: 1,overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )],
            ),
          )
        ),
        // Positioned(
        //   top: 18,
        //   right: 24,
        //   height: 121,
        //   child: !widget.map.expired ? Image.asset('assets/images/minecoursepage/expired.png', width: 92, height: 72,) : Text(''),
        // ),
      ],
    );
  }
}

Widget hasTeacher(bool hasTeacher, String avatarUrl) {
  if(!hasTeacher) {
    return Container(
      constraints: BoxConstraints.tight(Size(28, 28)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: NetworkImage(avatarUrl),
          fit: BoxFit.cover
        )
      ),
    );
  } else {
    return Container();
  }
}
