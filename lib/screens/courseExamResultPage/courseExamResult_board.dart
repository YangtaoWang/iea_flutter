import 'package:flutter/material.dart';
import 'package:iea/widgets/style_widget.dart';
import 'package:iea/models/courseExamResultPage_models/courseExamResult_model.dart';
import 'package:iea/screens/courseExamPage/courseExam_page.dart';

class ExamResultBoard extends StatefulWidget{
  final ExamResultDataModel resultMap;
  ExamResultBoard({Key key, @required this.resultMap}) :super(key:key);
  @override 
  State<StatefulWidget> createState() {
    return ExamResultBoardState();
  }
}

class ExamResultBoardState extends State<ExamResultBoard>{
  _boardList(List<ResultList>list){
    List<Widget> initList = [];
    for(int i = 0; i < list.length; i++) {
      initList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex) => CourseExamPage(isExaming: false, currentPage: i,)));
          },
          child: Stack(
            children: <Widget>[
              Container(
                width: 42,
                height: 42,
                child: Text((i+1).toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, decoration: TextDecoration.none,color: Color.fromRGBO(51, 51, 51, 1))),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border:Border.all(width: 1, color: !list[i].isChoosed ? Color.fromRGBO(186, 186, 186, 1) : list[i].isRight ? Colors.green : Colors.red),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 0,
                child: Text(!list[i].isChoosed ? '' : '\ue628', style: TextStyle(fontFamily: 'iconfont', color: list[i].isRight ? Colors.green : Colors.red),),
              )
            ],
          ),
        ),
      );
    }
    return initList;
  }
  @override 
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 1,
            decoration: BoxDecoration(
              color: Color.fromRGBO(151, 151, 151, 0.14)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 27, bottom: 25),
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Wrap(
              spacing: 30,
              runSpacing: 18,
              children: _boardList(widget.resultMap.resultList),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 206,
            height: 43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CW.c1,
              borderRadius: BorderRadius.circular(21.5)
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (contex) => CourseExamPage(isExaming: false, currentPage: 0,)));
              },
              child: Text('查看解析', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
            )
          )
        ],
      ),
    );
  }
}