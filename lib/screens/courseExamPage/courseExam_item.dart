import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:iea/widgets/style_widget.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
import 'package:iea/screens/courseExamPage/confirmDialog.dart';
import 'package:throttling/throttling.dart';

class CourseExamItem extends StatefulWidget{
  final List<Item> examList; // 题的列表
  final int examType;
  final PageController controller;
  final bool isExaming;
  final int currentPage;
  final int sum;
  final List<CourseExamDataModel> allExamInfo;
  
  CourseExamItem({Key key, @required this.controller, @required this.examList, @required this.examType, @required this.isExaming, @required this.currentPage, @required this.sum, @required this.allExamInfo}) : super(key :key);
  @override 
  State<StatefulWidget> createState() {
    return _CourseExamItemState();
  }
}

class _CourseExamItemState extends State<CourseExamItem>{
  final Debouncing deb = new Debouncing(duration: Duration(milliseconds: 1000));
  final Throttling thr = new Throttling(duration: Duration(milliseconds: 300));
  final List<String> wordList = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  // List<bool> choosedList = [false, false, false, false];
  // _initChooseList () {
  //   for(int i = 0; i < widget.examList.length; i++){
  //     widget.choosedList.add(false);
  //   }
  // }
  // isChoosedList (list) { // 这4个选项被选中的题
  //   List<bool> initList = [];
  //   for(int i = 0; i < list.length; i++) {
  //     initList.add(list[i].isChoosed);
  //   }
  //   return initList;
  // }
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
  getHowManyChoosed(List<List<bool>> allChoosedList){ // 获取做了几道题
    int i = 0;
    for(int j = 0; j < allChoosedList.length; j++) {
      if(allChoosedList[j].indexOf(true) == -1){
        i++;
      }
    }
    return allChoosedList.length - i;
  }
  _showDialog (BuildContext context) async { // 调起弹窗
    List<List<bool>> list = getAllChoosedList(widget.allExamInfo); // 选的所有题的组合
    int howmanyChoosed = getHowManyChoosed(list); // 
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogController) {
        return ConfirmDialog(isAnswered: howmanyChoosed, notAnswered: list.length - howmanyChoosed, dialogController: dialogController, allExamInfo: widget.allExamInfo,);
      },
    );
    print("result = $result");
  }
  //设置防抖周期为3s
  // Duration durationTime = Duration(milliseconds: 250);
  Timer timer;
  @override
  void initState() {
    super.initState();
  } 
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 18),
            padding: EdgeInsets.only(left: 7, right: 7),
            child: ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.examList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    print('点击');
                    if (!widget.isExaming) return; // 解析页面不可以点击
                      if(widget.examType == 2) { // 多选题点击
                          widget.examList[index].isChoosed = !widget.examList[index].isChoosed;
                          setState(() {
                            widget.examList[index] = widget.examList[index];
                          });
                      } else { // 单选和判断题点击
                        for(int i = 0; i < widget.examList.length; i++) {
                          index == i ? widget.examList[i].isChoosed = true : widget.examList[i].isChoosed = false;
                        }
                        setState(() {
                          widget.examList[index] = widget.examList[index];
                        });
                        if(widget.sum - 1 == widget.currentPage) return;
                        thr.throttle((){
                          print('进入');
                          // Timer(Duration(milliseconds: 200), (){
                              widget.controller.animateToPage(widget.currentPage + 1, duration: Duration(milliseconds: 300),curve: Curves.easeInOut,);
                            // });
                          
                        });
                        
                      }
                  },
                  child: Exam(word: wordList[index], text: widget.examList[index].info, isChoosed: widget.examList[index].isChoosed, isRight: widget.examList[index].isRight, isExaming: widget.isExaming, examType: widget.examType,),
                );
              },
            )
          ),
          GestureDetector( // 确认按钮
            onTap: (){
              if (getAllChoosedList(widget.allExamInfo)[widget.currentPage].indexOf(true) == -1) return;
              widget.controller.animateToPage(widget.currentPage + 1, duration: Duration(milliseconds: 300),curve: Curves.easeInOut,);
            },
            child: Offstage(
              offstage: !widget.isExaming ? true : widget.examType != 2 ? true : false,
              child: Container( 
                margin: EdgeInsets.only(top: 40),
                width: 265,
                height: 47,
                decoration: BoxDecoration(
                  color: (getAllChoosedList(widget.allExamInfo)[widget.currentPage].indexOf(true) == -1) ? CW.c2 : CW.c1,
                  borderRadius: BW.br(25),
                ),
                child: Text('确定', style:TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                alignment: Alignment.center,
              )
            ),
          ),
          GestureDetector( // 提交按钮
            onTap: (){
              print(widget.allExamInfo);
              // var list = getAllChoosedList(widget.allExamInfo);
              // int howmanyChoosed = getHowManyChoosed(list);
              // print(howmanyChoosed);
              _showDialog(context);
            },
            child: Offstage(
              offstage: !widget.isExaming ? true : widget.sum - 1 != widget.currentPage ? true : false,
              child: Container( 
                margin: EdgeInsets.only(top: 40),
                width: 265,
                height: 47,
                decoration: BoxDecoration(
                  color: CW.c1,
                  borderRadius: BW.br(25),
                ),
                child: Text('提交', style:TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                alignment: Alignment.center,
              )
            ),
          )
        ],
      ),
    );
  }
  @override 
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}





class Exam extends StatefulWidget{
  final String text;
  final String word;
  final bool isChoosed;
  final bool isRight;
  final bool isExaming;
  final int examType;
  Exam({Key key, @required this.text, @required this.word, @required this.isChoosed, @required this.isRight, @required this.isExaming, @required this.examType}): super(key: key);
  @override 
  State<StatefulWidget> createState() {
    return ExamState();
  }
}
class ExamState extends State<Exam>{
  @override 
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 22, right: 22, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: widget.isChoosed ? Color.fromRGBO(255, 243, 237, 0.65) : null
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:2),
            child: Text(widget.word, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: widget.isChoosed ? Color.fromRGBO(243, 110, 34, 1) : Color.fromRGBO(28, 47, 84, 1)),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.examType != 3 ? widget.text.substring(2) : widget.text,
                      style: TextStyle(fontSize: 15, color: widget.isChoosed ? Color.fromRGBO(243, 110, 34, 1) : Color.fromRGBO(28, 47, 84, 1), letterSpacing: 2.0)
                    ),
                    TextSpan(
                      text: ((!widget.isExaming & widget.isChoosed) | (!widget.isExaming & widget.isRight)) ? widget.isChoosed & !widget.isRight ? '   \ue628' : '   \ue629' : '',
                      style: TextStyle(fontFamily: 'iconfont', fontSize: 15, color: widget.isRight ? Colors.green : Colors.red),
                    )
                  ]
                )
              )
            )
          )
        ],
      ),
    );
  }
}

// _showDialog(context) async {
//   var result = await showDialog(
//     context: context,
//     builder: (ctx) {
//       return Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('ddd'),
//             // buildButton("返回1", () => Navigator.of(context).pop(1)),
//             // buildButton("返回2", () => Navigator.pop(context, 2)),
//           ],
//         ),
//       );
//     },
//   );
//   print("result = $result");
// }

