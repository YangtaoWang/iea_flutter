import 'package:flutter/material.dart';

class MyCoursePage extends StatefulWidget {
  MyCoursePage({Key key}) : super(key: key);
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //    child: ListView.separated(
    //      itemCount: 5,
    //      itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         height: 120,
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    //           child: Container(
    //             child: Row(
    //               children: <Widget>[
    //                 Container(
    //                   width: 145,
    //                   height: 81,
    //                   margin: EdgeInsets.only(right: 19),
    //                   child: Stack(
    //                     children: <Widget>[
    //                       ClipRRect(
    //                         child: Image.network('https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png', width: 145, height: 81, fit: BoxFit.cover),
    //                         borderRadius: BorderRadius.circular(5),
    //                       ),
    //                       Positioned(
    //                         left: 0,
    //                         top: 8,
    //                         child: Container(
    //                           child: Padding(
    //                             padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
    //                             child: Text('心理学', style: TextStyle(color: Colors.white, fontSize: 12),),
    //                           ),
    //                           decoration: BoxDecoration(
    //                             color: Color.fromRGBO(243, 110, 34, 0.96),
    //                             borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))
    //                           )
    //                         )
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Expanded(
    //                   flex: 1,
    //                   child: Container(
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: <Widget>[
    //                         Text('心理学产品包标题心理学产品包标题心理学产品包标题心理学产品包标题心理学产品包标题心理学产品包标题心理学产品包标题', style: TextStyle(fontSize: 15, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500), maxLines: 2,),
    //                         Container(
    //                           height: 28,
    //                           child: Row(
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: <Widget>[
    //                               ClipOval(
    //                                 child: Image.network('https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png', width: 28, height: 28, fit: BoxFit.cover,),
    //                               ),
    //                               Container(
    //                                 margin: EdgeInsets.only(left: 13),
    //                                 child: Text('高静老师', style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1))),
    //                               )
    //                             ],
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 )
                    
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //      },
    //      separatorBuilder: (BuildContext context, int index) {
    //        return Container(
    //          height: 10,
    //          decoration: BoxDecoration(
    //            color: Color.fromRGBO(247, 247, 247, 1)
    //          ),
    //        );
    //      },
    //    )
    // );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network('https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png', width: 198, height: 191, fit: BoxFit.cover,),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text('您还没有选课，去首页选课进入学习吧！', style: TextStyle(fontSize: 13, color: Color.fromRGBO(153, 153, 153, 1), fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}