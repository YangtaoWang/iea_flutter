import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/screens/courseExamPage/courseExam_des.dart';
import 'package:iea/screens/courseExamPage/courseExam_wrap.dart';
import 'package:iea/blocs/courseExamPage_blocs/courseExam_bloc.dart';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
import 'package:iea/utils/sign_util.dart';
import 'package:iea/utils/date_util.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';

class CourseExamPage extends StatefulWidget{
  int currentPage;
  bool isExaming;
  CourseExamPage({Key key, @required this.currentPage, @required this.isExaming}) : super(key: key);
  @override 
  State<StatefulWidget> createState() {
    return _CourseExamPageState();
  }
}

class _CourseExamPageState extends State<CourseExamPage>{
  // int currentPage = widget.currentPage;
  // bool isExaming = true; 
  PageController _controller;
  CourseExamBloc _bloc = new CourseExamBloc();
  List<CourseExamDataModel> examCourseList= [];
  _getCourseExamList () {
    String stringValue = DateUtils.getNowDateMs().toString(); // 获取当前时间戳

    Map<String, String> paramsmap = {'timestamp': stringValue};

    String md5string = httpUtil.sortMap(paramsmap);

    var params = {'timestamp': stringValue, 'sign': md5string};
    if(widget.isExaming){
      _bloc.getCourseExamList(params);
    } else {
      _bloc.getCourseExamResult(params);
    }
  }
  @override 
  void initState() {
    super.initState();
    _controller = new PageController(initialPage: widget.currentPage, keepPage: true, viewportFraction: 1.0);
    _getCourseExamList();
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Text('随堂考', style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: StreamBuilder<BaseResp>(
        stream: _bloc.courseExamStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
              var response = snapshot.data;
              if (response.result == true && response.data != null) {
                examCourseList = response.data;
                return Stack(
                  children: <Widget>[
                    Positioned(child: CourseExamDes(sum: examCourseList.length, currentPage: widget.currentPage, allExamInfo: examCourseList, pageController: _controller,),top: 0, left: 0,),
                    Padding(
                      padding: EdgeInsets.only(top: 44),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            widget.currentPage = index;
                          });
                        },
                        controller: _controller,
                        itemCount: examCourseList.length,
                        itemBuilder: (context, index){
                          return CourseExamWrap(controller: _controller, courseExamInfo: examCourseList[index], isExaming: widget.isExaming, currentPage: widget.currentPage, sum: examCourseList.length, allExamInfo: examCourseList,);
                        },
                      ),
                    ),
                    
                  ],
                );
              } else {
                return ErrorPage();
              }
            } else {
              return LoadingPage();
            }
        },
      )
    );
  }
}