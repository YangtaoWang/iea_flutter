import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/homepage_blocs/openclass_bloc.dart';
import 'package:iea/models/homepage_models/openclass_model.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:iea/utils/date_util.dart';
import 'package:iea/utils/sign_util.dart';

class HomePage extends StatefulWidget {
  final List openclasstypelist;
  HomePage({Key key, this.openclasstypelist}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tab> myTabs = <Tab>[]; // 创建tablist数组
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.openclasstypelist.length; i++) {
      myTabs.add(new Tab(
          child: new Text(
        widget.openclasstypelist[i].projectName,
        style: TextStyle(fontSize: 16.0),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // length: 3,
        length: widget.openclasstypelist.length,
        child: Scaffold(
          appBar: new AppBar(
            title: Text('logo',
                style: TextStyle(color: Colors.black, fontSize: 18.0)),
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                titleSpacing: 0.0,
                title: TabBar(
                  tabs: myTabs,
                  // tabs: myTabs2,
                  indicatorColor: Color.fromRGBO(255, 103, 0, 1),
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3.0,
                  labelStyle:
                      new TextStyle(color: Colors.black, fontSize: 16.0),
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true, // tab聚拢
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: _tabViewCounts(),
          ),
        ));
  }

  _tabViewCounts() {
    List<Widget> pagelist = [];
    for (int i = 0; i < widget.openclasstypelist.length; i++) {
      pagelist.add(EnglishOpenClassPage(
          projectId: widget.openclasstypelist[i].projectId));
    }
    return pagelist;
  }
}

class EnglishOpenClassPage extends StatefulWidget {
  final int projectId;
  EnglishOpenClassPage({Key key, this.projectId}) : super(key: key);
  @override
  _EnglishOpenClassPageState createState() => _EnglishOpenClassPageState();
}

class _EnglishOpenClassPageState extends State<EnglishOpenClassPage>
    with AutomaticKeepAliveClientMixin<EnglishOpenClassPage> {
  OpenClassBloc _bloc = new OpenClassBloc();

  List<InfoList> infolist = [];

  _getOpenClassEN() {
    String stringValue = DateUtils.getNowDateMs().toString();
    String stringprojectId = widget.projectId.toString();
    // String stringprojectId = '83';

    Map<String, String> paramsmap = {
      'projectId': stringprojectId,
      'timestamp': stringValue
    };

    String md5string = httpUtil.sortMap(paramsmap);

    var params = {
      'timestamp': stringValue,
      'sign': md5string,
      'projectId': stringprojectId
    };

    _bloc.getOpenClassENList(params);
  }

  @override
  void initState() {
    super.initState();

    _getOpenClassEN();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
        stream: _bloc.openClassStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data != null) {
              OpenClassModel openclassinfo = snapshot.data.data;

              infolist = snapshot.data.data.infoList;

              return ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("点击header");
                        },
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/homepage/testimage.png",
                                image: openclassinfo.mainImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: new NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: infolist.length,
                          itemExtent: 160.0, //强制设置宽高
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print("当前点击的index值是:$index");
                              },
                              child: new Container(
                                // height: 120.0,
                                padding: new EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                      bottom: new BorderSide(
                                        width: 1.0,
                                        color: const Color(0xff999999),
                                      ),
                                    ),
                                    color: Colors.white),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 210,
                                        height: 90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  "assets/images/homepage/testimage.png",
                                              image: infolist[index].cover,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    new Expanded(
                                      flex: 2,
                                      child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          new Container(
                                            // color: Colors.red,
                                            padding: new EdgeInsets.all(0.0),
                                            margin: EdgeInsets.only(
                                                top: 35, left: 15),
                                            child: new Text(
                                              infolist[index].className,
                                              style:
                                                  new TextStyle(fontSize: 18.0),
                                            ),
                                          ),
                                          new Container(
                                              //  color: Colors.blue,
                                              // padding:const EdgeInsets.only(right:13.0,bottom:15.0),
                                              margin: EdgeInsets.only(
                                                  bottom: 35, left: 15),
                                              child: new Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/homepage/5731557994768_.piccopy@3x.png',
                                                    width: 50,
                                                    height: 25,
                                                  ),
                                                  Container(
                                                    color: Colors.black,
                                                    margin: EdgeInsets.only(
                                                        left: 20),
                                                  ),
                                                  Text(
                                                      infolist[index]
                                                          .price
                                                          .toString(),
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough)),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  )
                ],
              );
            } else {
              return ErrorPage();
            }
          } else {
            return LoadingPage();
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}
