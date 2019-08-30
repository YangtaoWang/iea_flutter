import 'package:flutter/material.dart';
import 'main_banner.dart';
import 'main_goodList.dart';
// import 'main_openBanner.dart';
// import 'main_openList.dart';
import 'main_openWrap.dart';
import 'package:iea/widgets/loading.dart';
import 'package:iea/blocs/indexPage_blocs/index_allData.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin<MainPage> {
  @override
  bool get wantKeepAlive => true;

  IndexAllBloc _bloc = new IndexAllBloc();


  @override
  void initState() {
    _bloc.getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.getAllDataStream,
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.data != null && snapshot.hasData){
          return Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                snapshot.data[0].length != 0 ? MainBanner(indexBannerList: snapshot.data[0]) : Container(),
                // snapshot.data[1].length != 0 ? MainOpenBanner(openClassList: snapshot.data[1]) : Container(),
                // snapshot.data[2].length != 0 ? MainOpenList(openClassList: snapshot.data[2]) : Container() ,
                snapshot.data[1].length != 0 || snapshot.data[2].length != 0 ? OpenWrap(openClassBanner: snapshot.data[1], openClassList: snapshot.data[2],) : Container(),
                snapshot.data[3].length != 0 ? MainGoodList(indexMenuClassList: snapshot.data[3]) : Container()
              ],
            )
          );
        } else {
          return LoadingPage();
        }
      }
    );
  }
}