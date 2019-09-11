import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/screens/playerPage/player_page.dart';
import 'package:iea/sp/index.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:iea/widgets/serviceToast.dart';
import 'package:iea/models/goodDetailPage_models/goodDetail_model.dart';
import 'package:iea/blocs/goodDetailPage_blocs/goodDetail_bloc.dart';
class GoodDetailPage extends StatefulWidget {
  final String goodsId;
  GoodDetailPage({Key key, @required this.goodsId}) : super(key: key);

  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  int _currentSeries = 0;
  int _currentCourse = 0;
  bool _dropDown = false;
  GoodDetailBloc _bloc = GoodDetailBloc();
  _getGoodDetail(){
    Map<String, String> params = {'goodsId': widget.goodsId};
    _bloc.getGoodDetail(params);
  }
  @override 
  void initState() {
    _getGoodDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('详情', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
            child: Container(
              width: 35,
              height: 15,
              margin: EdgeInsets.only(right: 20, top: 12, bottom: 12),
              child: Image.asset('assets/images/openDetail/actionsHome.png', width: 35, height: 15, fit: BoxFit.fill),
            )
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<BaseResp>(
          stream: _bloc.goodDetail,
          builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
              var response = snapshot.data;
              if (response.result == true && response.data != null) {
                GoodDetailModle goodDetai = response.data;
                  return Container(
                    child: Stack(
                      children: <Widget>[
                        ListView(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              child: AspectRatio(
                                aspectRatio: 10.0 / 5.60,
                                child: ExtendedImage.network(
                                  goodDetai.cover,
                                  cache: true,
                                  enableLoadState: false,
                                  fit: BoxFit.fill
                                ),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.5),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: FractionalOffset.topLeft,
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(goodDetai.name, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 24, fontWeight: FontWeight.w500), maxLines: 2,),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(child: Text('￥' + goodDetai.price.round().toString(), style:TextStyle(fontSize: 27, color: Color.fromRGBO(243, 110, 34, 1))),),
                                          Opacity(opacity: goodDetai.discountPrice == null ? 0 : 1, child: Container(margin: EdgeInsets.only(left: 19), child: Text('￥' + (goodDetai.discountPrice == null ? '' : goodDetai.discountPrice), style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),))
                                        ],
                                      ),
                                      Text((goodDetai.learnerCount/10000).toString().substring(0,3) + '万次学习', style: TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Container(
                                margin: EdgeInsets.only(top: 28),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text('课程列表', style: TextStyle(fontSize: 19, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500)),
                                          Opacity(
                                            opacity: 1,
                                            child: Container(width: 24, height: 3, decoration: BoxDecoration(color: Color.fromRGBO(243, 110, 34, 1), borderRadius: BorderRadius.circular(47)),)
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 37),
                                      child: Column(
                                        children: <Widget>[
                                          Text('课程介绍', style: TextStyle(fontSize: 15, color: Color.fromRGBO(159, 159, 159, 1))),
                                          Opacity(
                                            opacity: 0,
                                            child: Container(width: 24, height: 3, decoration: BoxDecoration(color: Color.fromRGBO(243, 110, 34, 1), borderRadius: BorderRadius.circular(47)),)
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ),
                            Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 247, 247, 1)
                              ),
                            ),
                            Opacity(
                              opacity: goodDetai.courseModuleList.length > 0 ? 1 : 0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 43,
                                  child: Container(margin: EdgeInsets.only(top: 19), child: Text('全部课时：'+ goodDetai.lessonCount.toString() +'节课（有效期'+ goodDetai.serviceDays.toString() +'天）', style: TextStyle(fontSize: 13, color: Color.fromRGBO(153, 153, 153, 1))))
                                )
                              ),
                            ),
                            Opacity(
                              opacity: goodDetai.courseModuleList.length > 0 ? 1 : 0,
                                child: Container(
                                height: 86,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: goodDetai.courseModuleList.length,
                                  itemBuilder: (context, index){
                                    return GestureDetector(
                                      onTap: () {
                                        this.setState((){
                                          _currentSeries = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: index == 0 ? 15 : 9, right: index == 5 ? 15 : 0, top: 14, bottom: 14),
                                        width: 145,
                                        height: 61,
                                        decoration: index == _currentSeries
                                        ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          boxShadow: [BoxShadow(blurRadius: 11, color: Color.fromRGBO(192, 192, 192, 0.5), offset: Offset(0, 2))],
                                          gradient: LinearGradient(colors: [Color.fromRGBO(234, 189, 176, 1), Color. fromRGBO(243, 110, 34, .5)], begin: Alignment.centerLeft, end: Alignment.centerRight)
                                        )
                                        : BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/goodDetail/icon_course_card_unsel.png'),
                                            fit: BoxFit.cover
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                          boxShadow: [BoxShadow(blurRadius: 11, color: Color.fromRGBO(192, 192, 192, 0.5), offset: Offset(0, 2))],
                                          gradient: LinearGradient(colors: [Color.fromRGBO(234, 189, 176, 1), Color. fromRGBO(243, 110, 34, .5)], begin: Alignment.centerLeft, end: Alignment.centerRight)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 21,
                                              height: 27,
                                              margin: EdgeInsets.only(left: 9, right: 10),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(index == _currentSeries ? 'assets/images/goodDetail/icon_course_flag_sel.png': 'assets/images/goodDetail/icon_course_flag_unsel.png')
                                                )
                                              ),
                                              alignment: FractionalOffset.center,
                                              child: Text((index + 1).toString(), style: TextStyle(color: index == _currentSeries ? Colors.white : Color.fromRGBO(153, 153, 153, 1), fontSize: 13),),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.only(right: 2),
                                                child: Text(goodDetai.courseModuleList[index].moduleName, style: TextStyle(fontSize: 13, color: index == _currentSeries ? Colors.white : Color.fromRGBO(153, 153, 153, 1)), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                              )
                                            )
                                          ],
                                        ),
                                      )
                                    );
                                  }
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: goodDetai.courseModuleList.length > 0 ? 1 : 0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: _dropDown ? goodDetai.courseModuleList[_currentSeries].lessonList.length : goodDetai.courseModuleList[_currentSeries].lessonList.length > 4 ? 4 : goodDetai.courseModuleList[_currentSeries].lessonList.length,
                                    physics: ScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (goodDetai.courseModuleList[_currentSeries].lessonList[index].isWatch == 2) return;
                                          print(goodDetai.goodsId);
                                          print(goodDetai.courseModuleList[_currentSeries].lessonList[index].videoId);
                                          print(goodDetai.courseModuleList[_currentSeries].lessonList[index].moduleLessonId);
                                          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                                            return PlayerPage(goodsId: goodDetai.goodsId, videoId: goodDetai.courseModuleList[_currentSeries].lessonList[index].videoId, moduleLessonId: goodDetai.courseModuleList[_currentSeries].lessonList[index].moduleLessonId,);
                                          }));
                                        },
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 44,
                                                alignment: FractionalOffset.centerLeft,
                                                child: Image.asset(goodDetai.courseModuleList[_currentSeries].lessonList[index].isWatch == 1 ? 'assets/images/goodDetail/icon_course_state_play.png' : 'assets/images/goodDetail/icon_course_state_lock.png', width: 23, height: 23, fit: BoxFit.cover,),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(bottom: BorderSide(color: Color.fromRGBO(221, 221, 221, 1), width: 0.5))
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 12),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  margin: EdgeInsets.only(bottom: 3),
                                                                  child: Text(goodDetai.courseModuleList[_currentSeries].lessonList[index].courseName, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)), maxLines: 2,),
                                                                ),
                                                                Row(
                                                                  children: <Widget>[
                                                                    Image.asset(goodDetai.courseModuleList[_currentSeries].lessonList[index].learnRate == 0 ? 'assets/images/goodDetail/icon_play_status_unplay.png' : 'assets/images/goodDetail/icon_play_status_play.png', width: 9, height: 10, fit: BoxFit.cover,),
                                                                    Container(child: Text(goodDetai.courseModuleList[_currentSeries].lessonList[index].learnRate != 0 ? '已学习' + goodDetai.courseModuleList[_currentSeries].lessonList[index].learnRate.toString() + '%' : '未开始', style: TextStyle(color: goodDetai.courseModuleList[_currentSeries].lessonList[index].learnRate == 0 ? Color.fromRGBO(153, 153, 153, 1) : Color.fromRGBO(243, 110, 34, 1), fontSize: 12),), margin: EdgeInsets.only(left: 4),)
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          ),
                                                          Container(
                                                            width: 56,
                                                            margin: EdgeInsets.only(left: 20),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[
                                                                Container(
                                                                  width: 1,
                                                                  height: 28,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(229, 229, 229, 1)
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    children: <Widget>[
                                                                      ClipOval(
                                                                        child: goodDetai.courseModuleList[_currentSeries].lessonList[index].teacherAvatarUrl != null
                                                                        ? ExtendedImage.network(
                                                                          goodDetai.courseModuleList[_currentSeries].lessonList[index].teacherAvatarUrl,
                                                                          cache: true,
                                                                          enableLoadState: false,
                                                                          fit: BoxFit.cover,
                                                                          width: 28, 
                                                                          height: 28
                                                                        ) : Image.asset('assets/images/goodDetail/icon_course_teacher_default_photo.png', width: 28, height: 28),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(top: 2),
                                                                        child: Text(goodDetai.courseModuleList[_currentSeries].lessonList[index].teacherName != null ? goodDetai.courseModuleList[_currentSeries].lessonList[index].teacherName : 'IEA', style: TextStyle(fontSize: 12, color: Color.fromRGBO(51, 51, 51, 1)), maxLines: 1,),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                    
                                                  ),
                                              )
                                            ],
                                          ),
                                        )
                                      );
                                    }
                                  )
                                )
                              ),
                            ),
                            Opacity(
                              opacity: goodDetai.courseModuleList[_currentSeries].lessonList.length <= 4 ? 0 : 1,
                              child: GestureDetector(
                                onTap: () {
                                    this.setState((){
                                      _dropDown = !_dropDown;
                                    });
                                },
                                child: Container(
                                  height: 55,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(_dropDown ? '立即收起' : '展开更多', style: TextStyle(color: Color.fromRGBO(255, 93, 0, 1), fontSize: 11)),
                                      Container(child: Image.asset(_dropDown ? 'assets/images/goodDetail/icon_course_top_arrow.png' : 'assets/images/goodDetail/icon_course_bottom_arrow.png', width: 9, height: 5, fit: BoxFit.cover,), margin: EdgeInsets.only(left: 3))
                                    ],
                                  ),
                                ),
                              )
                            ),
                            
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                alignment: FractionalOffset.centerLeft,
                                child: Text('课程介绍', style: TextStyle(fontSize: 19, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w500)),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Html(
                              data: goodDetai.courseContent == null ? '<p></p>' : goodDetai.courseContent
                            )
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white
                              // color: response.data.bottomStatus == '3' ? Colors.transparent : Colors.white
                            ),
                            child: ConsultAndPlay(isBuied: goodDetai.bottomStatus.toString() == '4', isOn: goodDetai.bottomStatus.toString() == '3', goodDetail: goodDetai)
                          ),
                        )
                      ],
                    ) 
                  );
                } else {
                return ErrorPage();
              }
            } else {
              return LoadingPage();
            }
          }
        )
      )
      
      
    );
  }
}

class ConsultAndPlay extends StatefulWidget {
  bool isBuied;
  final bool isOn;
  final GoodDetailModle goodDetail;
    ConsultAndPlay({Key key, @required this.isBuied, @required this.isOn, @required this.goodDetail}) : super(key: key);
    _ConsultAndPlayState createState() => _ConsultAndPlayState();
  }


class _ConsultAndPlayState extends State<ConsultAndPlay> {
  bool _isLogin;
  _checkIsLogin() async{
    String res = await SP().getData('authorization');
    if(res != null) {
      _isLogin = true;
    } else {
      _isLogin = false;
    }
  }
  _showService (BuildContext context) async { // 调起性别弹窗
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogController) {
        return ServiceToast();
      },
    );
    print("result = $result");
  }


  @override
  void initState() {
    _checkIsLogin();
    super.initState();
  }
  @override
  void deactivate() {
    _checkIsLogin();
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isOn 
      ? Container(
        height: 30,
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, .5)
        ),
        child: Text('产品已下架', style: TextStyle(color: Colors.white, fontSize: 15)),
      ) 
      : widget.isBuied
      ? Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _showService(context);
            },
            child: Container(
              height: 52,
              width: 85,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/openDetail/course_consult.png', width: 25, height: 21,),
                  Text('咨询', style: TextStyle(fontSize: 12, color: Color.fromRGBO(51, 51, 51, 1)))
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/player');
              },
              child: Container(
                height: 52,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 110, 34, 1)
                ),
                child: Text('开始学习',  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500))
              ),
            )
          )
        ],
      )
      : Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 193,
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Container(margin: EdgeInsets.only(left: 5), child: Text('￥' + widget.goodDetail.price.round().toString(), style:TextStyle(fontSize: 27, color: Color.fromRGBO(243, 110, 34, 1))))
                  ),
                  Container(margin: EdgeInsets.only(left: 10), child: Text(widget.goodDetail.discountPrice == null ? '' : '￥' + widget.goodDetail.discountPrice.round().toString(), style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if (!_isLogin) {
                Navigator.pushNamed(context, '/phone');
              } else {
                _showService(context);
              }
            },
            child: Container(
              width: 140,
              height: 52,
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 110, 34, 1)
              ),
              child: Text('购买咨询', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}