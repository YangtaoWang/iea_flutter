import 'package:flutter/material.dart';
import 'package:iea/utils/screen_util.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
import 'package:iea/screens/courseExamPage/examBoard.dart';
// import 'package:iea/utils/date_util.dart';
import 'dart:async';
class CourseExamDes extends StatefulWidget{
  int timeNum = 0;
  final int sum;
  final int currentPage;
  final List<CourseExamDataModel> allExamInfo;
  final PageController pageController;
  CourseExamDes({Key key, @required this.sum, @required this.currentPage, @required this.allExamInfo, @required this.pageController}) : super(key: key);
  @override 
  State<StatefulWidget> createState() {
    return CourseExamDesState();
  }
}

class CourseExamDesState extends State<CourseExamDes>{
  int timeNum = 0;
  Timer timer;
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeNum = timeNum + 1;
      });
    });
  }

  transTimer(int num){
    String secondsNum;
    String minutes;
    String hours;
    if (num < 60){
      minutes = '00';
    } else if (num >= 60 && num < 3600) {
      if ((num ~/ 60) < 10){
        minutes = '0' + (num ~/ 60).toString();
      } else {
        minutes = (num ~/ 60).toString();
      }
    } else {
      if(num~/60%60 < 10){
        minutes = '0' + (num~/60%60).toString();
      } else {
        minutes = (num~/60%60).toString();
      }
      if(num~/3600 < 10) {
        hours = '0' + (num~/3600).toString();
      } else {
        hours = (num~/3600).toString();
      }
    }

    if(num%60 < 10) {
      secondsNum = '0' + (num%60).toString();
    } else {
      secondsNum = (num%60).toString();
    }
    if(num < 3600){
      return minutes + ':' +secondsNum;
    } else {
      return hours + ':' + minutes + ':' +secondsNum;
    }
  }
  getAllChoosedList(List<CourseExamDataModel> list) { // 过滤做过的选项为二维数组
    List<List<bool>> initList = [];
    for(int i = 0; i < list.length; i++) {
      List<bool> innerList = [];
      for(int j = 0; j < list[i].items.length; j++) {
        innerList.add(list[i].items[j].isChoosed);
      }
      initList.add(innerList);
    }
    return initList; 
  }
  _showBoard (BuildContext context) async { // 调起弹窗
    List<List<bool>> list = getAllChoosedList(widget.allExamInfo); // 选的所有题的组合
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogController) {
        return ExamBoard(dialogController: context, currentPage: widget.currentPage, allChoosedList: list, pageController: widget.pageController,);
      },
    );
    print("result = $result");
  }
  @override 
  void initState() {
    super.initState();
    startTimer();
  }
  @override 
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil(width: 375)..init(context);
    return Container(
      height: 44,
      width: ScreenUtil().setWidth(375),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(249, 247, 247, 1))),
        // color: Colors.white
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(transTimer(timeNum), style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 15),),
              GestureDetector(
                child: Image.asset('assets/images/courseExamPage/examBoard.png', width: 17, height: 17),
                onTap: () {
                  _showBoard(context);
                },
              )
            ],
          ),
          Positioned(
            right: 25,
            bottom: 7,
            child: Container(
              // margin: EdgeInsets.only(left: 240),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: (widget.currentPage + 1).toString(),
                      style: TextStyle(color: Color.fromRGBO(28, 47, 84, 1), fontSize: 25, fontWeight: FontWeight.w500)
                    ),
                    TextSpan(
                      text: '/${widget.sum}',
                      style: TextStyle(fontSize: 13, color: Color.fromRGBO(28, 47, 84, 1))
                    )
                  ]
                )
              ),
            ),
          )
        ],
      ) 
    );
  }
  @override 
  void dispose() {
    timeNum = 0;
    super.dispose();
    timer?.cancel();
  }
}
