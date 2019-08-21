import 'package:flutter/material.dart';
import 'package:iea/widgets/style_widget.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
class ConfirmDialog extends StatefulWidget{
  final int isAnswered;
  final int notAnswered;
  final List<CourseExamDataModel> allExamInfo;
  final BuildContext dialogController;
  ConfirmDialog({Key key, @required this.isAnswered, @required this.notAnswered, @required this.allExamInfo, @required this.dialogController});
  @override
  State<StatefulWidget> createState() {
    return ConfirmDialogState();
  }
}

class ConfirmDialogState extends State<ConfirmDialog>{
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: 292,
                height: 285,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(image: AssetImage('assets/images/courseExamPage/dialogBg.png'), fit: BoxFit.cover)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Image.asset('assets/images/courseExamPage/dialogTip.png', width: 24, height: 31,),
                            margin: EdgeInsets.only(right: 10),
                          ),
                          Text('确认提交？', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500, decoration: TextDecoration.none))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 63, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 60),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(widget.isAnswered.toString(), style: TextStyle(color: CW.c1, fontSize: 30, fontWeight: FontWeight.w600, decoration: TextDecoration.none),),
                                ),
                                Text('已答题', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize:12, decoration: TextDecoration.none, fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(widget.notAnswered.toString(), style: TextStyle(color: CW.c1, fontSize: 30, fontWeight: FontWeight.w600, decoration: TextDecoration.none),),
                              ),
                              Text('未答题', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize:12, decoration: TextDecoration.none, fontWeight: FontWeight.w400))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(width: 260,height: 1,color: Color.fromRGBO(151, 151, 151, 0.1),margin: EdgeInsets.only(bottom: 7),),
                    Text('随堂考初次成绩非常重要哦～', style: TextStyle(fontSize: 13, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.none, fontWeight: FontWeight.w400),),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: 118,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(220, 220, 220, 1),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Text('返回检查', style: TextStyle(color: Color.fromRGBO(120, 120, 120, 1), fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.w400),),
                              alignment: Alignment.center,
                            ),
                            onTap: () {
                              Navigator.pop(widget.dialogController);
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 118,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 110, 34, 1),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Text('交卷', style: TextStyle(color: Colors.white, fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.w400),),
                              alignment: Alignment.center,
                            ),
                            onTap: () {
                              Navigator.pop(widget.dialogController);
                              Navigator.pushNamed(context, '/courseExamAnswer');
                            },
                          )
                          
                        ],
                      )
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Image.asset('assets/images/courseExamPage/closeDialog.png', width: 25, height: 25,),
                onTap: (){
                  Navigator.pop(widget.dialogController);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}