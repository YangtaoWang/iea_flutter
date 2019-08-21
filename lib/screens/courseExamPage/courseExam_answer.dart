import 'package:flutter/material.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
// import 'package:flutter_html_view/flutter_html_view.dart';
class CourseExamAnswer extends StatefulWidget{
  final AnswerInfo answerInfo;
  CourseExamAnswer({Key key, @required this.answerInfo}) : super(key: key);
  @override 
  State<StatefulWidget> createState() {
    return CourseExamAnswerState();
  }
}

class CourseExamAnswerState extends State<CourseExamAnswer>{
  // List<String> imgList = ['https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png','https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/f5dfdfd6513c49d78b4d0df20d51c2dd.png'];
  // _imgListWidget(list){
  //   List<Widget> initList = [];
  //   list.forEach((e){
  //     initList.add(Image.network(e, fit: BoxFit.cover));
  //   });
  //   return initList;
  // }
  @override 
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 13, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('试题详解', style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 15, fontWeight: FontWeight.w500)),
                Container(margin: EdgeInsets.only(top: 10), child: Text('您的答案：${widget.answerInfo.yourText}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(28, 47, 84, 1)),),),
                Container(margin: EdgeInsets.only(top: 10), child: Text('参考答案：${widget.answerInfo.answerText}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(28, 47, 84, 1)),),),
                Container(margin: EdgeInsets.only(top: 4),child: Text(widget.answerInfo.exp.text, style: TextStyle(fontSize: 15, color: Color.fromRGBO(28, 47, 84, 1), height: 2),),),
                Container(
                  child: Image.network(widget.answerInfo.exp.img, fit: BoxFit.cover),
                )
                // Column(
                //   children: _imgListWidget(imgList),
                // )
                // HtmlView(data: '<p style="color: red">今天天气不错</p>',)
              ],
            ),
          )
        ],
      )
    );
  }
}