import 'package:iea/provider/resource/indexpage_api_provider.dart';
import 'dart:async';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';

class IndexAllBloc {
  final _apiClient = IndexPageApiProvider();

  StreamSubscription _indexAllSubscription;
  final StreamController _indexAllController =
      StreamController.broadcast();
  Stream get getAllDataStream => _indexAllController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  Future<List<IndexOpenCourseModel>> _getBanner() async{
    Map<String, String>  params = {'type': '1'};
    BaseResp data = await _apiClient.getIndexBanner(params);
    if (data.result) {
      data.data = (data.data as List).map((value) => IndexOpenCourseModel.fromJson(value)).toList();
    }
    return data.data;
  }
  Future<List<IndexOpenClassModel>> _getOpenBanner() async{
    Map<String, String>  params = {'type': '1'};
    BaseResp data = await _apiClient.openClassList(params);
    if (data.result) {
      data.data = (data.data as List).map((value) => IndexOpenClassModel.fromJson(value)).toList();
    }
    return data.data;
  }
  Future<List<IndexOpenClassModel>> _getOpenList() async{
    Map<String, String>  params = {'type': '2'};
    BaseResp data = await _apiClient.openClassList(params);
    if (data.result) {
      data.data = (data.data as List).map((value) => IndexOpenClassModel.fromJson(value)).toList();
    }
    return data.data;
  }
  Future<List<IndexGoodCourseModel>> _getGoodList() async{
    BaseResp data = await _apiClient.indexMenuClassList();
    if (data.result) {
      data.data = (data.data as List).map((value) => IndexGoodCourseModel.fromJson(value)).toList();
    }
    return data.data;
  }
  // _getAll() async {
  //   List res = await Future.wait([_getBanner(), _getOpenBanner(), _getOpenList(), _getGoodList()]);
  // }
  void getAllData() async{
    _indexAllSubscription?.cancel();
    _indexAllSubscription = Future.wait([_getBanner(), _getOpenBanner(), _getOpenList(), _getGoodList()]).asStream().listen((data){
      _indexAllController.add(data);
    });

    // _indexAllSubscription = _apiClient
    //     .openClassList(params)
    //     .asStream()
    //     .listen((BaseResp data) {
    //   if (data.result) {
    //     data.data = (data.data as List)
    //         .map((value) => IndexOpenClassModel.fromJson(value))
    //         .toList();
    //   }
    //   _indexAllController.add(data);
    // });
  }

  void dispose() {
    _indexAllSubscription?.cancel();
    _indexAllController.close();
  }
}