import 'package:flutter/material.dart';
import 'package:iea/blocs/myCoursePage_blocs/myCourse_bloc.dart';
import 'package:iea/models/loginPage_models/userInfo_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/sp/index.dart';
// import 'package:iea/utils/service_locator.dart';
import 'dart:convert' as convert;
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:extended_image/extended_image.dart';

class MyCoursePage extends StatefulWidget {
  MyCoursePage({Key key}) : super(key: key);
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> with AutomaticKeepAliveClientMixin<MyCoursePage> {
  @override
  bool get wantKeepAlive => true;

  MyCourseBloc _bloc = MyCourseBloc();
  _getMyCourse() async{
    String res = await SP().getData('userInfo');
    if (res != null) {
      UserInfo userInfo = UserInfo.fromJson(convert.jsonDecode(res));
      Map<String, String> params = {'id': userInfo.id.toString()};
      _bloc.getList(params);
    }
  }
  // @override 
  void deactivate() async{
    if(await SP().getData('a') != null){ // 避免401跳转时，循环调用
      _getMyCourse();
    }
    super.deactivate();
  }
  @override
  void initState() {
    _getMyCourse();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return ErrorPage(errorCallback: _getMyCourse);
    return StreamBuilder<BaseResp>(
      stream: _bloc.myCourse,
      builder: (BuildContext context, AsyncSnapshot<BaseResp> snapshot){
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
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
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: ExtendedImage.network(
                                          response.data.purchasedCourses[index].cover,
                                          cache: true,
                                          enableLoadState: false,
                                          fit: BoxFit.fill,
                                          width: 145,
                                          height: 81,
                                        )
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
                                                child: ExtendedImage.network(
                                                  response.data.purchasedCourses[index].avatarUrl,
                                                  cache: true,
                                                  enableLoadState: false,
                                                  fit: BoxFit.fill,
                                                  width: 28,
                                                  height: 28,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 13),
                                                  child: Text(response.data.purchasedCourses[index].tname, style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                                )
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
              return ErrorPage(tokenNum: response.code, errorCallback: _getMyCourse);
          }
        } else {
          return LoadingPage();
        }
      },
    );
  }
}