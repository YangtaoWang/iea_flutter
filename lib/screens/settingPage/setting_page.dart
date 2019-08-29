import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/provider/resource/settingPage_api_provider.dart';
import 'package:iea/sp/index.dart';
import 'package:path_provider/path_provider.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isLogin = false;
  String _cacheSizeStr;
  _getUserInfo() async{
    String res = await SP().getData('userInfo');
    if(res != null) {
      setState(() {
        isLogin = true;
      });
    }
  }
  _logout() async{
    BaseResp data = await SettingPageApiProvider().logout();
    return data;
  }
  _logoutClick() async{
    BaseResp data = await _logout();
    if (data.code == 200) {
      Fluttertoast.showToast(msg: "退出登录成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
      SP().removeData('userInfo');
      SP().removeData('a');
      SP().removeData('authorization');
      Navigator.of(context).pop();
    }
  }
  ///加载缓存
  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      print('临时目录大小: ' + value.toString());
      setState(() {
        _cacheSizeStr = _renderSize(value);
      });
    } catch (err) {
      print(err);
    }
  }
  ///格式化文件大小
  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }
  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }
  void _clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      Fluttertoast.showToast(msg: "清除缓存成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "清除缓存失败",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
    } finally {
      //此处隐藏加载loading
    }
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
            final List<FileSystemEntity> children = file.listSync();
            for (final FileSystemEntity child in children) {
              await delDir(child);
            }
          }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    loadCache();
    _getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('设置', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1)
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 62,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('关于', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                        Row(
                          children: <Widget>[
                            Text('V1.2.0', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
                            Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3, color: Color.fromRGBO(151, 151, 151, .3)))
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _clearCache();
                    },
                    child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none)
                    ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('清除缓存', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                          Text(_cacheSizeStr == null ? '' : _cacheSizeStr, style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14))
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            Opacity(
              opacity: isLogin ? 1 : 0,
              child: GestureDetector(
                onTap: _logoutClick,
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  height: 62,
                  alignment: FractionalOffset.center,
                  child: Text('退出登录', style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 18)),
                )
              )
            )
          ],
        )
      )
    );
    
  }
}