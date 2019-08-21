import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iea/widgets/style_widget.dart';


class ExamBoard extends StatefulWidget{
  final List<List<bool>> allChoosedList;
  final int currentPage;
  final BuildContext dialogController;
  final PageController pageController;
  ExamBoard({Key key, @required this.allChoosedList, @required this.currentPage, @required this.dialogController, @required this.pageController}) : super(key:key);
  @override 
  State<StatefulWidget> createState() {
    return ExamBoardState();
  }
}

class ExamBoardState extends State<ExamBoard>{
  _answerList(List<List<bool>>list, int currentPage){
    List<Widget> initList = [];
    for(int i = 0; i < list.length; i++) {
      initList.add(
        GestureDetector(
          onTap: (){
            Navigator.pop(widget.dialogController);
            widget.pageController.animateToPage(i, duration: Duration(milliseconds: 300),curve: Curves.easeInOut,);
          },
          child: Container(
            width: 42,
            height: 42,
            child: Text((i+1).toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, decoration: TextDecoration.none,color: i == currentPage ? Colors.white : list[i].indexOf(true) == -1 ? Color.fromRGBO(102, 102, 102, 1) : Color.fromRGBO(51, 51, 51, 1))),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              border: i == currentPage ? null : Border.all(width: 1, color: list[i].indexOf(true) == -1 ? Color.fromRGBO(186, 186, 186, 1) : CW.c1),
              color: i == currentPage ? CW.c1 : null
            ),
          )),
        );
    }
    return initList;
  }
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            child: Image.asset('assets/images/courseExamPage/closeDialog.png', width: 25, height: 25,),
            onTap: (){
              Navigator.pop(widget.dialogController);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
              color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 29,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/courseExamPage/boardHead.png'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: Text('答题卡', style: TextStyle(fontWeight: FontWeight.w400, decoration: TextDecoration.none, color: Color.fromRGBO(51, 51, 51, 1), fontSize: 19),),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  height: 40,
                ),
                Container(height: 1, margin: EdgeInsets.only(left: 16, right: 16),decoration: BoxDecoration(color: Color.fromRGBO(151, 151, 151, 0.23)),),
                Container(
                  margin: EdgeInsets.only(top: 18, bottom: 25),
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Wrap(
                    spacing: 28,
                    runSpacing: 18,
                    children: _answerList(widget.allChoosedList, widget.currentPage),
                  )
                )
              ],
            )
          )
          
        ],
      ),
    );
  }
}