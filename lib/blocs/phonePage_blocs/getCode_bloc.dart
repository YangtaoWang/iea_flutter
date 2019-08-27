import 'package:iea/provider/resource/phonepage_api_provider.dart';
import 'dart:async';
import 'package:iea/provider/base/base_resp.dart';

class PhoneCodeBloc {
  final _apiClient = PhonePageApiProvider();

  StreamSubscription _phoneCodeSubscription;
  final StreamController _phoneCodeController = StreamController.broadcast();
  Stream get phoneCodeStream => _phoneCodeController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  
  void getCode(params) async{
    _phoneCodeSubscription?.cancel();
    _phoneCodeSubscription = _apiClient
        .getCode(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        print(data.code);
      }
      _phoneCodeController.add(data.code);
    });
  }

  void dispose() {
    _phoneCodeSubscription?.cancel();
    _phoneCodeController.close();
  }
}