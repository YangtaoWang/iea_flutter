import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/blocs/settingPage_blocs/WxInfo_bloc.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

import 'error.dart';
import 'loading.dart';

class ServiceToast extends StatefulWidget {
  ServiceToast({Key key}) : super(key: key);
  _ServiceToastState createState() => _ServiceToastState();
}

class _ServiceToastState extends State<ServiceToast> {
  WxInfoBloc _bloc = WxInfoBloc();

  _getWX(){
    _bloc.getWX();
  }
  Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true}) async {
    var data = await getNetworkImageData(url, useCache: useCache);
    var filePath = await ImagePickerSaver.saveFile(fileData: data);
    return filePath != null && filePath != "";
  }
  _savePic (url) async{
   bool res = await saveNetworkImageToPhoto(url);
   Fluttertoast.showToast(msg: res ? "保存成功" : '保存失败', toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
  }
  @override
  void initState() {
    _getWX();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.wxInfo,
      builder: (context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            return Container(
              alignment: Alignment.center,
              child: Container(
                width: 297,
                height: 388,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 14, bottom: 9),
                        child: Text('咨询客服', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20, decoration: TextDecoration.none, fontWeight: FontWeight.w500)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('微信咨询', style: TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1), decoration: TextDecoration.none, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(response.data.name + ': ' + response.data.wechatNo, style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), decoration: TextDecoration.none, fontWeight: FontWeight.normal), maxLines: 1,),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: response.data.wechatNo));
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(msg: "复制成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                              },
                              child:  Container(
                                width: 92,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 240, 240, 1),
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                alignment: FractionalOffset.center,
                                child: Text('复制微信号', style: TextStyle(color: Color.fromRGBO(255, 160, 100, 1), fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                              )
                            )
                          ],
                        ),
                      ),
                      ExtendedImage.network(
                        response.data.wechatPic,
                        cache: true,
                        enableLoadState: false,
                        fit: BoxFit.fill,
                        width: 168,
                        height: 168,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 17),
                        child: Text('保存图片到相册，打开微信扫一扫添加老师', style: TextStyle(fontSize: 11, color: Color.fromRGBO(51, 51, 51, 1), decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('afas');
                          _savePic(response.data.wechatPic);
                        },
                        child: Container(
                          width: 187,
                          height: 41,
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 110, 34, 1),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Text('保存图片', style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none, fontWeight: FontWeight.w500)),
                        )
                      ),
                    ],
                  ),
                )
                
              )
            );
          } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      },
    );
  }
}