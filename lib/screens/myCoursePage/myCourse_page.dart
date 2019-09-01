import 'package:flutter/material.dart';
import 'package:iea/blocs/myCoursePage_blocs/myCourse_bloc.dart';
import 'package:iea/models/loginPage_models/userInfo_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/sp/index.dart';
import 'dart:convert' as convert;

import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';

class MyCoursePage extends StatefulWidget {
  MyCoursePage({Key key}) : super(key: key);
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  MyCourseBloc _bloc = MyCourseBloc();
  _getMyCourse() async{
    String res = await SP().getData('userInfo');
    UserInfo userInfo = UserInfo.fromJson(convert.jsonDecode(res));
    Map<String, String> params = {'id': userInfo.id.toString()};
    _bloc.getList(params);
  }
  @override 
  void deactivate() {
    _getMyCourse();
    super.deactivate();
  }
  @override
  void initState() {
    _getMyCourse();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
      stream: _bloc.myCourse,
      builder: (BuildContext context, AsyncSnapshot<BaseResp> snapshot){
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            print(response.data.purchasedCourses);
            if (response.data.purchasedCourses.length == 0) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network('https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/flutter/images/noCourse.png', width: 198, height: 191, fit: BoxFit.cover,),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text('您还没有选课，去首页选课进入学习吧！', style: TextStyle(fontSize: 13, color: Color.fromRGBO(153, 153, 153, 1), fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                child: ListView.separated(
                  itemCount: response.data.purchasedCourses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/player');
                      },
                      child: Container(
                        height: 120,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 145,
                                  height: 81,
                                  margin: EdgeInsets.only(right: 19),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        child: Image.network(response.data.purchasedCourses[index].cover, width: 145, height: 81, fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 8,
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
                                            child: Text(response.data.purchasedCourses[index].isCourse == 1 ? '公开课' : '精品课', style: TextStyle(color: Colors.white, fontSize: 12),),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(243, 110, 34, 0.96),
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))
                                          )
                                        )
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(response.data.purchasedCourses[index].isCourse == 1 ? response.data.purchasedCourses[index].ocName : response.data.purchasedCourses[index].goName, style: TextStyle(fontSize: 15, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500), maxLines: 2,),
                                        Container(
                                          height: 28,
                                          child: response.data.purchasedCourses[index].isCourse == 1
                                          ? Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              ClipOval(
                                                child: Image.network(response.data.purchasedCourses[index].avatarUrl, width: 28, height: 28, fit: BoxFit.cover,),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 13),
                                                child: Text(response.data.purchasedCourses[index].tname, style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1))),
                                              )
                                            ],
                                          ) : Row(
                                            children: <Widget>[
                                              Text('共' + '${response.data.purchasedCourses[index].lessionCount}' + '节',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            ],
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                        ),
                      )
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 247, 1)
                      ),
                    );
                  },
                )
              );
            }
            } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      },
    );
  }
}