import 'package:flutter/material.dart';
import 'package:iea/utils/screen_util.dart';
class TeacherDes extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil(width: 375)..init(context);
    return Container(
      width: ScreenUtil().setWidth(375),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/playerPage/teacherBg.png'),
          fit: BoxFit.fill
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tightFor(width: 98, height: 24),
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 114, 40, 1),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12), topRight: Radius.circular(12),)
            ),
            margin: EdgeInsets.only(left: 14, top: 22),
            child: Text('讲师介绍/', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500)),
          ),
          Container(
            margin: EdgeInsets.only(left: 14, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset('assets/images/courseExamAnswerPage/resultBg3.png',
                    width: 42,
                    height: 42,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 3,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5),
                    color: Color.fromRGBO(151, 151, 151, 0.3)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('吴双', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18, fontWeight: FontWeight.w500),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('Wu Shuang', style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14),)
                )
                
              ],
            ),
          ),
          Offstage(
            offstage: false,
            child: Container(
              margin: EdgeInsets.only(left: 28, right: 28, top: 12),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Color.fromRGBO(243, 114, 40, 0.36))
                    ),
                    child: Text('1981年2月出生于上海，中共党员。复旦大学哲学系博士，加拿大温哥华UBC大学Regent College访问学者。2005年2月-2008年6月在复旦大学哲学系基督教哲学专业2005年2月-2008年6月在复旦大学哲学系基督教哲学专业', style: TextStyle(color: Color.fromRGBO(154, 133, 128, 1), fontSize: 14, height: 1.1),)
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Image.asset('assets/images/playerPage/bgTop.png', width: 24, height: 24,),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/playerPage/bgBottom.png', width: 24, height: 23,),
                  )
                ],
              ),
            )
          ),
          Offstage(
            offstage: true,
            child: Container(
              margin: EdgeInsets.only(left: 14, right: 14, top: 10),
              child: Image.network('https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/15dd95dce0584c008a8b8a4a7fcee397.png'),
            )
            
          )
          
        ],
      ),
    );
  }
}

