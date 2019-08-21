import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_header.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_board.dart';
import 'package:iea/blocs/courseExamResultPage_blocs/courseExamResult_bloc.dart';
import 'package:iea/models/courseExamResultPage_models/courseExamResult_model.dart';
import 'package:iea/utils/sign_util.dart';
import 'package:iea/utils/date_util.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:iea/provider/base/base_resp.dart';

class CourseExamResultPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return CourseExamResultPageState();
  }
}
class CourseExamResultPageState extends State<CourseExamResultPage>{
  ExamResultBloc _bloc = new ExamResultBloc();
  ExamResultDataModel resultMap;
  _getExamResult(){
    String stringValue = DateUtils.getNowDateMs().toString(); // 获取当前时间戳

    Map<String, String> paramsmap = {'timestamp': stringValue};

    String md5string = httpUtil.sortMap(paramsmap);

    var params = {'timestamp': stringValue, 'sign': md5string};
    _bloc.getExamResult(params);
  }
  @override 
  void initState() {
    super.initState();
    _getExamResult();
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Text('结果页', style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: StreamBuilder<BaseResp>(
        stream: _bloc.examResultStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data != null) {
              resultMap = response.data;
              return Container(
                child: ListView(
                  children: <Widget>[
                    ExamResultHeader(resultMap: resultMap),
                    ExamResultBoard(resultMap: resultMap)
                  ],
                ),
              );
            } else {
              return ErrorPage();
            }
          } else {
            return LoadingPage();
          }
        }
      )
    );
    
  }
}