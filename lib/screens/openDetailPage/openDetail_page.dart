import 'package:flutter/material.dart';
import 'package:iea/blocs/openDetailPage_blocs/openDetail_bloc.dart';
import 'package:extended_image/extended_image.dart';
// import 'package:iea/models/homepage_models/openclass_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:iea/models/openDetailPage_models/openDetail_model.dart';
import 'package:iea/provider/resource/openDetailPage_api_provider.dart';
import 'package:iea/widgets/serviceToast.dart';
import 'package:iea/sp/index.dart';

class OpenDetailPage extends StatefulWidget {
  final String openClassId;
  OpenDetailPage({Key key, @required this.openClassId}) : super(key: key);
  _OpenDetailPageState createState() => _OpenDetailPageState();
}

class _OpenDetailPageState extends State<OpenDetailPage> {
  OpenDetailBloc _bloc = OpenDetailBloc();
  // OpenDetailModel _openDetail;
  _getOpenDetail(){
    Map<String, String> params = {'openClassId': widget.openClassId};
    _bloc.getOpenDetail(params);
  }

  @override
  void deactivate() {
    _getOpenDetail();
    super.deactivate();
  }
  @override
  void initState() {
    _getOpenDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder<BaseResp>(
        stream: _bloc.openDetail,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data != null) {
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
                              response.data.cover,
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
                                child: Text(response.data.name, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 24, fontWeight: FontWeight.w500), maxLines: 2,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/openDetail/timeFree.png', width: 65, height: 18, fit: BoxFit.cover,),
                                      Container(margin: EdgeInsets.only(left: 19), child: Text('￥' + response.data.price.toString(), style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),)
                                    ],
                                  ),
                                  Text((response.data.learnerCount/10000).toString().substring(0,3) + '万次学习', style: TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 8,
                          margin: EdgeInsets.only(top: 21),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(247, 247, 247, 1)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: FractionalOffset.topLeft,
                                margin: EdgeInsets.only(top: 12, bottom: 14),
                                child: Text('授课讲师', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18, fontWeight: FontWeight.w500)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 11),
                                    child: ClipOval(
                                      child: ExtendedImage.network(
                                        response.data.teacherAvatarUrl,
                                        cache: true,
                                        enableLoadState: false,
                                        fit: BoxFit.fill
                                      ),
                                    )
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          alignment: FractionalOffset.centerLeft,
                                          child: Text(response.data.teacherName, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18, fontWeight: FontWeight.w500)),
                                        ),
                                        Container(
                                          child: Text(response.data.teacherIntroduce, style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1), fontSize: 13)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: FractionalOffset.topLeft,
                                margin: EdgeInsets.only(top: 36, bottom: 14),
                                child: Text('课程介绍', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18, fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                child: Html(
                                  data: response.data.courseContent == null ? '<p></p>' : response.data.courseContent
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: response.data.bottomStatus == '3' ? Colors.transparent : Colors.white
                        ),
                        child: ConsultAndPlay(isBuied: response.data.bottomStatus == 4, isOn: response.data.bottomStatus == 3, openDetail: response.data)
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
    );
  }
}


class ConsultAndPlay extends StatefulWidget {
  bool isBuied;
  final bool isOn;
  final OpenDetailModel openDetail;
  ConsultAndPlay({Key key, @required this.isBuied, @required this.isOn, @required this.openDetail}) : super(key: key);
  _ConsultAndPlayState createState() => _ConsultAndPlayState();
}

class _ConsultAndPlayState extends State<ConsultAndPlay> {
  bool _isLogin;
  _checkIn() async{
    Map<String, String> params = {'openClassId': '136'};
    final res = await OpenDetailPageApiProvider().checkIn(params);
    _changeStatusByRes(res.code);
  }
  _changeStatusByRes(code){
    if(code == 200) {
      setState(() {
        widget.isBuied = true;
      });
    }
  }
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
                Navigator.pushNamed(context, '/player');
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
          Container(
            width: 193,
            height: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Image.asset('assets/images/openDetail/timeFree.png', width: 49, height: 14, fit: BoxFit.cover,),
                ),
                Container(margin: EdgeInsets.only(left: 5), child: Text('￥' + widget.openDetail.price.toString(), style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              _showService(context);
            },
            child: Container(
              width: 62,
              height: 52,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 148, 86, 1)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 1),
                    child: Image.asset('assets/images/openDetail/consult.png', width: 25, height: 21, fit: BoxFit.cover,),
                  ),
                  Text('咨询', style: TextStyle(fontSize: 12, color: Colors.white))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                if (!_isLogin) {
                  Navigator.pushNamed(context, '/phone');
                } else {
                  _checkIn();
                }
              },
              child: Container(
                height: 52,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 110, 34, 1)
                ),
                child: Text('立即报名', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            )
          )
        ],
      ),
    );
  }
}