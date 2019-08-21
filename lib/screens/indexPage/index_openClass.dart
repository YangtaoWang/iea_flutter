import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/indexPage_blocs/index_openClass_bloc.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
class IndexOpenClass extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => _IndexOpenClassState();
}
class _IndexOpenClassState extends State<IndexOpenClass>{
  GetopenClassListBloc _bloc = new GetopenClassListBloc();
  List<IndexOpenClassModel> indexClassList = [];
   _getIndexBanner() {
    Map<String, String>  params = {'type': '2'};
    _bloc.getopenClassList(params);
  }
  _dot(val) {
    final count = val.indexOf('.') > 0 ? '万' : '';
    return val + count;
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
            indexClassList = snapshot.data.data;
            return Container(
              height: 115.0,
              constraints: BoxConstraints(),
              padding: EdgeInsets.symmetric(horizontal: 11.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: indexClassList.length,
                itemBuilder: (BuildContext context,int index){
                  return listItem(indexClassList[index]);
                }
              ),
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
  // 横向滑动列表
  Widget listItem(item){
    return Container(
      width: 156.0,
      margin: EdgeInsets.only(top: 20.0, right: 6.0, left: 6.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print(item);
            },
            child: Column(
              children: <Widget>[
                Container(
                  width: 156.0,
                  height: 57.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                      image: NetworkImage(item.bannerUrl == null ? '' : item.bannerUrl),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(item.learnerCount ==null ? '' : _dot(item.learnerCount) +'人',
                      style: TextStyle(fontSize: 12.0, color: Color.fromRGBO(253, 150, 128, 1), height: 1.8),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8.0)),
                    Text( item.learnerCount ==null ? '' : '正在学习',
                      style: TextStyle(fontSize: 12.0, color: Color.fromRGBO(153, 153, 153, 1), height: 1.8),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}