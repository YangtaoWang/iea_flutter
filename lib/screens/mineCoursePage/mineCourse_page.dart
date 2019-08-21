import 'package:flutter/material.dart';
import 'package:iea/blocs/mineCoursePage_blocs/getList_bloc.dart';
import 'package:iea/models/mineCoursePage_models/courseList_model.dart';
import 'package:iea/screens/mineCoursePage/MineCourseListItem.dart';

import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/utils/sign_util.dart';
// import 'package:iea/utils/date_util.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';

class MineCoursePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MineCoursePageState();
  }
}

class _MineCoursePageState extends State<MineCoursePage>{
  MineCourseListBloc _bloc = new MineCourseListBloc();
  List<PurchasedCourse> mineCourseList = [];
  _getList() {
    // String stringValue = DateUtils.getNowDateMs().toString(); // 获取当前时间戳

    Map<String, String> paramsmap = {'id': '44'};

    // String md5string = httpUtil.sortMap(paramsmap);

    // var params = {'timestamp': stringValue, 'sign': md5string};
    _bloc.getList(paramsmap);
  }
  @override
  void initState() {
    super.initState();
    _getList();
  }
  @override
  Widget build(BuildContext context){
    return StreamBuilder<BaseResp>(
      stream: _bloc.mineCourseList,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot<BaseResp> snapshot){
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            mineCourseList = response.data.purchasedCourses;
            print(mineCourseList);
            return Container(
              color: Colors.white,
              child: ListView.separated(
                  itemCount: mineCourseList.length,
                  itemBuilder: (context, index) {
                    return  MineCourseListItem(map: mineCourseList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 10,
                      color: Color.fromRGBO(247, 247, 247, 1),
                    );
                  },
              )
            );
          } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      },
    );
    // return
  }
}