import 'package:flutter/material.dart';
// import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/courseDetailPage_blocs/imgList_bloc.dart';
import 'package:iea/models/courseDetailPage_models/imgList_model.dart';
import 'package:iea/utils/sign_util.dart';
import 'package:iea/utils/date_util.dart';
// import 'package:iea/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/AppState.dart';
// import 'package:iea/widgets/error.dart';
// import 'package:iea/widgets/loading.dart';
class CourseDetailPage extends StatefulWidget{
  final int num;
  CourseDetailPage({Key key, @required this.num}) : super(key: key);
  @override 
  State<StatefulWidget> createState() {
    return CourseDetailPageState();
  }
}

class CourseDetailPageState extends State<CourseDetailPage>{
  // List<List<String>> imgList = [
  //   [
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/f5dfdfd6513c49d78b4d0df20d51c2dd.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/92ff8ac64f564236939dda26c54185de.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/f94fc8015cc2448e971d24ea1f39a22a.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/245ad41d9de445a58da79caa62e0e3a2.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/487859b2537f4bfaaed44f4196b572c5.png'
  //   ],
  //   [
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/15dd95dce0584c008a8b8a4a7fcee397.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/2e0a3a67225745d0a43867d19912e0cf.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/6137778346374200a0ed6377201b47bb.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/e91fdce9240f48f5a060128dc09b9381.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fada5c7fa914461384176d08741c8c57.png',
  //     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/cd5053c4847246b5a55f8ee88ba0e435.png'
  //   ]
    
  // ];
  // int num;
  ImgListBloc _bloc = new ImgListBloc();
  List<ImgListDataModel> imgList = [];

  _getImgList() {
    String stringValue = DateUtils.getNowDateMs().toString(); // 获取当前时间戳

    Map<String, String> paramsmap = {'timestamp': stringValue};

    String md5string = httpUtil.sortMap(paramsmap);

    var params = {'timestamp': stringValue, 'sign': md5string};
    _bloc.getImgList(params);
  }
  @override 
  void initState() {
    super.initState();
    _getImgList();
  }
  @override 
  Widget build(BuildContext context){
    // num = ModalRoute.of(context).settings.arguments;
    // print(num);
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: imgList[widget.num].length,
    //     itemBuilder: (context, index){
    //       return ListTile(
    //         title: Image.network(imgList[widget.num][index]),
    //       );
    //     },
    //   )
    // );
    // return StreamBuilder<BaseResp>(
    //   stream: _bloc.imgListStream,
    //   builder: (context, AsyncSnapshot<BaseResp> snapshot) {
    //       if (snapshot.data != null && snapshot.hasData) {
    //         var response = snapshot.data;
    //         if (response.result == true && response.data != null) {
    //           imgList = response.data;
    //           print(imgList[0].bannerHref);
    //           return Scaffold(
    //             body: ListView.builder(
    //               itemCount: imgList.length,
    //               itemBuilder: (context, index){
    //                 return Image.network(imgList[index].bannerImg);
    //               },
    //             )
    //           );
    //         } else {
    //           return ErrorPage();
    //         }
    //       } else {
    //         return LoadingPage();
    //       }
    //     }
    // );
    return Scaffold(
      body: StoreConnector<AppState,int>(
        converter: (store) => store.state.countState.count,
        builder: (context, count) {
          return Text(
            count.toString(),
            style: Theme.of(context).textTheme.display1,
          );
        },
      )
    );
    
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:iea/widgets/style_widget.dart';
// import 'package:iea/utils/screen_util.dart';


// class ExamBoard extends StatefulWidget{
//   final List<List<bool>> allChoosedList;
//   final int currentPage;
//   final BuildContext dialogController;
//   ExamBoard({Key key, @required this.allChoosedList, @required this.currentPage, @required this.dialogController}) : super(key:key);
//   @override 
//   State<StatefulWidget> createState() {
//     return ExamBoardState();
//   }
// }

// class ExamBoardState extends State<ExamBoard>{
//   _answerList(List<List<bool>>list, int currentPage){
//     List<Widget> initList = [];
//     for(int i = 0; i < list.length; i++) {
//       initList.add(Container(
//         width: 42,
//         height: 42,
//         child: Text(i.toString(), style: TextStyle(fontSize: 20, color: i == currentPage ? Colors.white : list[i].indexOf(true) == -1 ? Color.fromRGBO(102, 102, 102, 1) : Color.fromRGBO(51, 51, 51, 1))),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(21),
//           border: i == currentPage ? null : Border.all(width: 1, color: list[i].indexOf(true) == -1 ? Color.fromRGBO(186, 186, 186, 1) : CW.c1),
//           color: i == currentPage ? CW.c1 : null
//         ),
//       ));
//     }
//     return initList;
//   }
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override 
//   Widget build(BuildContext context){
//     ScreenUtil.instance = ScreenUtil(width: 375)..init(context);
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Container(
//             width: ScreenUtil().setWidth(375),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
//               color: Colors.white
//             ),
//             child: Column(
//               children: _answerList(widget.allChoosedList, widget.currentPage),
//             )
//           )
          
//         ],
//       ),
//     );
//   }
// }