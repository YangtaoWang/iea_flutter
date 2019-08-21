import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/indexPage_blocs/index_goodCourse_bloc.dart';
import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';

class GoodCourse extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => _GoodCourseState();
}
class _GoodCourseState extends State<GoodCourse>
  with AutomaticKeepAliveClientMixin<GoodCourse> {
  @override
  bool get wantKeepAlive => true;
  IndexMenuClassListBloc _bloc = new IndexMenuClassListBloc();
  List<IndexGoodCourseModel> indexMenuClassList = [];
    _getIndexBanner() {
    _bloc.indexMenuClassList();
  }
  @override
  void initState() {
    super.initState();
    _getIndexBanner();
  }
  @override
  Widget build(BuildContext context){
    return StreamBuilder<BaseResp>(
      stream: _bloc.indexMenuClassListStream,
      builder: (context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            indexMenuClassList = snapshot.data.data;
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 375.0,
                    padding: EdgeInsets.only(left: 17.0),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Color.fromRGBO(255, 255, 255, 1), width: 10.0))
                    ),
                    child: Text('精品好课试听',
                      style: TextStyle(fontSize: 17.0, color: Color.fromRGBO(25, 25, 25, 1), height: 1.5, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('精品好课试听');
                    },
                    child: Container(
                      width: 341.0,
                      height: 118.0,
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(indexMenuClassList[0].bannerUrl),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: indexMenuClassList.length,
                      padding: EdgeInsets.only(top: 0),
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                        return listItem(indexMenuClassList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index){
                        return Container(
                          height: 1.0,
                          margin: EdgeInsets.symmetric(horizontal: 17.0),
                          decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
                        );
                      }
                    ),
                  ),
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
    );
  }
  // 精品好课列表
  Widget listItem(item){
    return GestureDetector(
      onTap: (){
        print(item);
        Navigator.pushNamed(context, '/feedback');
      },
      child: Container(
        decoration: BoxDecoration(color: null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 146.0,
              height: 81.0,
              margin: EdgeInsets.only(left: 17.0, top: 15.0, bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(item.gdCover != null ? item.gdCover : ''),
                  fit: BoxFit.fill,
                )
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 165.0,
                  height: 45.0,
                  margin: EdgeInsets.all(13.0),
                  child: Text(item.goName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17.0),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 15.0),),
                    Text(item.discountPrice == null ? '￥' + item.price : '￥' + item.discountPrice,
                      style: TextStyle(color: item.discountPrice == null ?  Color.fromRGBO(25, 25, 25, 0.8) : Color.fromRGBO(253, 150, 128, 1) , fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0),),
                    Text(item.discountPrice == null ? '' : '￥' + item.price,
                      style: TextStyle(decoration: TextDecoration.lineThrough, color: Color.fromRGBO(216, 216, 216, 1), fontSize: 15.0),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}