import 'package:flutter/material.dart';
import 'package:iea/widgets/style_widget.dart';
import 'package:iea/models/courseExamResultPage_models/courseExamResult_model.dart';
import 'package:iea/screens/courseExamPage/courseExam_page.dart';

class ExamResultHeader extends StatefulWidget{
  final ExamResultDataModel resultMap;
  ExamResultHeader({Key key, @required this.resultMap}) :super(key:key);
  @override 
  State<StatefulWidget> createState() {
    return ExamResultHeaderState();
  }
}

class ExamResultHeaderState extends State<ExamResultHeader>{
  @override 
  Widget build(BuildContext context){
    return Container(
      height: 403,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/courseExamAnswerPage/resultBg3.png'), fit:BoxFit.cover)
      ),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('随堂考-结果', style: TextStyle(fontSize: 15, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500),)
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(151, 151, 151, 0.14)))
                ),
              ),
              Positioned(
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (contex) => CourseExamPage(isExaming: true, currentPage: 0,)));
                  },
                  child: Text('重考', style: TextStyle(fontSize: 13, color: CW.c1),),
                )
              ),
            ],
          ),
          Container(
            width: 50,
            height: 20,
            margin: EdgeInsets.only(top: 130),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(255, 180, 5, 1)
            ),
            alignment: Alignment.center,
            child: Text('得分', style:TextStyle(color: Colors.white, fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.resultMap.getNote}分/',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  TextSpan(
                    text: '${widget.resultMap.sumNote}分',
                    style: TextStyle(fontSize: 12, color: Colors.white)
                  )
                ]
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 44),
            child: Text('用时${widget.resultMap.time}', style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text('距离拿证的距离还有很长，需要加强联系哦~', style: TextStyle(color: CW.c1),),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '答对 ',
                    style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12, fontWeight: FontWeight.w500)
                  ),
                  TextSpan(
                    text: '${widget.resultMap.right}/${widget.resultMap.sumExam}',
                    style: TextStyle(color: CW.c1, fontSize: 16)
                  )
                ]
              )
            ),
          )
        ],
      ),
    );
  }
}