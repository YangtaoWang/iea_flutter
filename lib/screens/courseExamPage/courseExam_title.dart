import 'package:flutter/material.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart' as CourseExam;
class CourseExamTitle extends StatefulWidget{
  final List<String> typeList = ['单选题', '多选题', '判断题'];
  final CourseExam.Title titleInfo;
  final int typeInfo;
  CourseExamTitle({Key key, @required this.titleInfo, @required this.typeInfo}) : super(key:key);
  @override 
  State<StatefulWidget> createState() {
    return CourseExamTitleState();
  }
}

class CourseExamTitleState extends State<CourseExamTitle>{
  // List<String> imgList = ['https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/a70861bda19cb2ae3407bc50a4433039/image.png','https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/d96515c02716eca1bdb672b47e2c4696/image.png', 'https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/ec09c1c1bc5aee30b6b35961bd4d082f/image.png', 'https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/8c8fa4294f4e5f4c7dbb6be5d8332113/image.png', 'https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/613d145fe3f309642d668471a48ada0e/image.png', '	https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/21a3268863b9e41c66398b731a940de7/image.png', 'http://store.sunlands.com/qiyejia/original/20190315/1106394902735175680.png', 'http://store.sunlands.com/qiyejia/original/20190320/1108327583865716737.png', 'https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/0f3a7b195e81ae640ba347e184c4056b/image.png', 'https://sfs-public.shangdejigou.cn/teach-resource/question_content/picture/03051175b2f4ca963d096aad90f99953/image.png', 'http://store.sunlands.com/qiyejia/original/20190225/1099935159232667648.png'];
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
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Stack(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '占位文字zi',
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0), fontSize: 13,)
                          ),
                          TextSpan(
                            text: '(${widget.titleInfo.note}分)',
                            style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1))
                          ),
                          TextSpan(
                            text: ' ${widget.titleInfo.text}',
                            style: TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500, height: 1.1)
                          )
                        ]
                      )
                  )
                  ],
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 58,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 110, 34, 1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10),),
                    ),
                    alignment: Alignment.center,
                    child: Text(widget.typeList[widget.typeInfo - 1], style: TextStyle(fontSize: 12, color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
          // Column(
          //   children: _imgListWidget(imgList),
          // ),
          Container(
            child: Image.network(widget.titleInfo.img, fit: BoxFit.cover,),
          ),
          Divider(height: 2, color: Color.fromRGBO(151, 151, 151, 1),)
        ],
      ),
    );
  }
}