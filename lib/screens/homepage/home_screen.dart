import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/blocs/homepage_blocs/openclasstype_bloc.dart';
import 'package:iea/models/homepage_models/openclasstype_model.dart';
import 'package:iea/screens/homepage/home_page.dart';
import 'package:iea/utils/sign_util.dart';
import 'package:iea/utils/date_util.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  OpenClassTypeListBloc _bloc = new OpenClassTypeListBloc();

  List<OpenClassTypeModel> openClassTypeList = [];

  _getOpenClassType() {
    String stringValue = DateUtils.getNowDateMs().toString(); // 获取当前时间戳

    Map<String, String> paramsmap = {'timestamp': stringValue};

    String md5string = httpUtil.sortMap(paramsmap);

    var params = {'timestamp': stringValue, 'sign': md5string};

    _bloc.getOpenClassENList(params);
  }

  @override
  void initState() {
    super.initState();

    _getOpenClassType();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
        stream: _bloc.openClassStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data != null) {
              openClassTypeList = snapshot.data.data;

              print(
                '打印当前数组的个数 ${openClassTypeList.length}',
              );
              print(
                '打印当前projectName ${openClassTypeList[0].projectName}',
              );
              print(
                '打印当前"projectId ${openClassTypeList[0].projectId}',
              );

              return HomePage(openclasstypelist: openClassTypeList);
            } else {
              return ErrorPage();
            }
          } else {
            return LoadingPage();
          }
        });
  }
}
