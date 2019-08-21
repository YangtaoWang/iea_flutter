import 'dart:async';
import 'package:iea/models/courseDetailPage_models/imgList_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/resource/courseDetailPage_api_provider.dart';

class ImgListBloc {
  final _apiClient = CourseDetailPageApiProvider();

  StreamSubscription<BaseResp> _imgListSubscription;
  final StreamController<BaseResp> _imgListController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get imgListStream => _imgListController.stream;

  /*
  *  获取公开课信息列表
  * @links
  */
  void getImgList(params) {
    _imgListSubscription?.cancel();
    _imgListSubscription =
        _apiClient.getImgList(params).asStream().listen((BaseResp data) {
         if (data.result) {
        data.data = (data.data as List)
            .map((value) => ImgListDataModel.fromJson(value))
            .toList();
      }
      _imgListController.add(data);
    });
  }

  void dispose() {
    _imgListSubscription?.cancel();
    _imgListController.close();
  }
}
