import 'dart:async';
// import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:dio/dio.dart';
// import 'package:iea/provider/base/network_config.dart';
import 'package:iea/utils/sign_util.dart';
import 'package:iea/utils/date_util.dart';
// import 'package:iea/main.dart';

enum LoadingStatus { onLoading, offLoading }
LoadingStatus _loadingStatus = LoadingStatus.offLoading;

class BaseApiProvider {
  Dio dio = new Dio();
  static final nonTokenUrls = ['/open-api/', 'https://platform'];

  static final noAuthUrl = [];

  verifyMiddleWare(dynamic temp) {
    if (temp is Response) {
      final res = temp.data;
      if (200 == res['code'] || '200' == res['code']) {
        if (res['code'] is String) {
          return BaseResp(
              code: int.parse(res['code']),
              msg: res['msg'],
              result: true,
              data: res['data']);
        } else {
          return BaseResp(
              code: res['code'],
              msg: res['msg'],
              result: true,
              data: res['data']);
        }
      } else {
        return BaseResp(code: res['code'], msg: res['msg'], result: false);
      }
    } else {
      return temp;
    }
  }

  BaseApiProvider() {
    dio.options.connectTimeout = 5000; //10s
    dio.options.receiveTimeout = 3000;

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      if (_loadingStatus == LoadingStatus.offLoading) {
        _loadingStatus = LoadingStatus.onLoading;
      }

      var addToken = true, addAuth = true;

      for (var i = 0; i < nonTokenUrls.length; i++) {
        if (options.uri.toString().indexOf(nonTokenUrls[i]) != -1) {
          addToken = false;
          break;
        }
      }

      for (var i = 0; i < noAuthUrl.length; i++) {
        if (options.uri.toString().indexOf(noAuthUrl[i]) != -1) {
          addAuth = false;
          break;
        }
      }

      if (addAuth) {
        String timestamp = DateUtils.getNowDateMs().toString(); // 获取当前时间戳
        if(options.method == "POST") {
          options.data['timestamp'] = timestamp;
          String sign = httpUtil.sortMap(options.data);
           options.data['sign'] = sign;
        } else {
          options.queryParameters['timestamp'] = timestamp;
           // 创建sign
          String sign = httpUtil.sortMap(options.queryParameters);
          options.queryParameters['sign'] = sign;
        }
        // options.queryParameters['timestamp'] = timestamp;
        // 创建sign
        // String sign = httpUtil.sortMap(options.queryParameters);
        // options.queryParameters['sign'] = sign;
        if (addToken) {
          //  options.headers['token'] = LocalDataProvider.getInstance().getToken();
        }
      }
      return options; //continue
    }, onResponse: (Response response) {
      if (_loadingStatus == LoadingStatus.onLoading) {
        _loadingStatus = LoadingStatus.offLoading;
        //  Navigator.pop(MyApp.navigatorKey.currentState.overlay.context);
      }
      return response; // continue
    }, onError: (DioError e) {
      if (_loadingStatus == LoadingStatus.onLoading) {
        _loadingStatus = LoadingStatus.offLoading;
        // Navigator.pop(MyApp.navigatorKey.currentState.overlay.context);
      }
      // Fluttertoast.showToast(msg: e.response.data['msg']);
      return _onError(e); //continue
    }));
  }

  post(url, [var params]) async {
    Completer completer = Completer();
    dio.post(url, data: params).then((res) {
      completer.complete(res);
    }).catchError((error) {
      completer.complete(error);
    });
    return completer.future;
  }
  static const  Map<String, dynamic> initParams = {};
  get(url, [var params = initParams]) {
    Completer completer = Completer();
    dio.get(url, queryParameters: params).then((res) {
      completer.complete(res);
    }).catchError((error) {
      completer.complete(_handleError(error));
    });
    return completer.future;
  }

  _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "SEND_TIMEOUT";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }

    return Response(data: {
      "code": CustomRespCode.networkFail,
      "result": false,
      "data": errorDescription
    });
  }

  Future _onError(DioError error) {
    Completer completer = Completer();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          // RequestOptions options = error.request;

          break;
        case DioErrorType.DEFAULT:
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          break;
        case DioErrorType.RESPONSE:
          break;
        case DioErrorType.SEND_TIMEOUT:
          break;
      }
    }
    return completer.future;
  }
}
