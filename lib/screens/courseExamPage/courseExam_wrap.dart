import 'package:flutter/material.dart';
import 'package:iea/screens/courseExamPage/courseExam_item.dart';
import 'package:iea/screens/courseExamPage/courseExam_title.dart';
import 'package:iea/screens/courseExamPage/courseExam_answer.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
class CourseExamWrap extends StatefulWidget{
  final bool isExaming;
  final PageController controller;
  final CourseExamDataModel courseExamInfo;
  final int currentPage;
  final int sum;
  final List<CourseExamDataModel> allExamInfo;
  CourseExamWrap({Key key, @required this.controller, @required this.courseExamInfo, @required this.isExaming, @required this.currentPage, @required this.sum, @required this.allExamInfo}) : super(key:key);
  @override 
  State<StatefulWidget> createState() {
    return CourseExamWrapState();
  }
}

class CourseExamWrapState extends State<CourseExamWrap>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override 
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        CourseExamTitle(titleInfo: widget.courseExamInfo.title, typeInfo: widget.courseExamInfo.type),
        CourseExamItem(controller: widget.controller, examList: widget.courseExamInfo.items, examType: widget.courseExamInfo.type, isExaming: widget.isExaming, currentPage: widget.currentPage,sum: widget.sum, allExamInfo: widget.allExamInfo,),
        Offstage(
          offstage: widget.isExaming,
          child: CourseExamAnswer(answerInfo: widget.courseExamInfo.answerInfo,)
        )
      ],
    );
  }
}