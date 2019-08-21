import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/indexPage_blocs/index_openClass_bloc.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'index_banner.dart';
import 'index_openClass.dart';
import 'index_goodCourse.dart';
class OpenCourse extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => _OpenCourseState();
}

class _OpenCourseState extends State<OpenCourse>
  with AutomaticKeepAliveClientMixin<OpenCourse> {
  @override
  bool get wantKeepAlive => true;
  GetopenClassListBloc _bloc = new GetopenClassListBloc();
  List<IndexOpenClassModel> indexOpenList = [];
  _getIndexBanner() {
    Map<String, String>  params = {'type': '1'};
    _bloc.getopenClassList(params);
  }
  @override
  void initState() {
    super.initState();
    _getIndexBanner();
  }
  @override 
  Widget build(BuildContext context){
    return StreamBuilder<BaseResp>(
      stream: _bloc.getopenClassListStream,
      builder: (context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            indexOpenList = snapshot.data.data;
            return Column(
              children: <Widget>[
                Indexbanner(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 17.0),
                  child: Text('公开课',
                    style: TextStyle(color: Colors.black, fontSize: 17.0,),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print('公开课');
                    Navigator.pushNamed(context, '/courseExam');
                  },
                    child: Container(
                    width: 341.0,
                    height: 160.0,
                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 17.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Color.fromRGBO(233, 233, 233, 1), width: 1.0,),
                      image: DecorationImage(
                        image: NetworkImage(indexOpenList[0].bannerUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                IndexOpenClass(),
                GoodCourse(),
              ],
            );
          } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      }
    );
  }
}