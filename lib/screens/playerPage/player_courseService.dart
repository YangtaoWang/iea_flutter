import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class CourseService extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return CourseServiceState();
  }
}

class CourseServiceState extends State<CourseService>{
  // 申请权限
  Future<bool> _checkPermission() async {
    // 先对所在平台进行判断
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }
  // 获取存储路径
  Future<String> _findLocalPath() async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    return directory.path;
  }
  // 获取存储路径
  // getSaveDir() async {
  //   var _localPath = await _findLocalPath() + '/Download';
  //   final savedDir = Directory(_localPath);
  //   // 判断下载路径是否存在
  //   bool hasExisted = await savedDir.exists();
  //   // 不存在就新建路径
  //   if (!hasExisted) {
  //     savedDir.create();
  //   }
  // }
  

  // 根据 downloadUrl 和 savePath 下载文件
  _downloadFile(savePath) async {
    await FlutterDownloader.enqueue(
      url: 'https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/file/025a6a29-c746-451c-b88e-bc86aa65fe1c.png',
      savedDir: savePath,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  @override 
  void initState() {
    super.initState();
  }

  @override 
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
                var _localPath = await _findLocalPath();
                final savedDir = Directory(_localPath);
                // 判断下载路径是否存在
                bool hasExisted = await savedDir.exists();
                // 不存在就新建路径
                if (!hasExisted) {
                  print('新建路径');
                  savedDir.create();
                  print(savedDir);
                }
                _downloadFile(_localPath);
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(151, 151, 151, 0.1)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/playerPage/download.png', width: 15, height: 16,),
                  Container(
                    child: Text('资料下载', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18),),
                    margin: EdgeInsets.only(left: 13),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(151, 151, 151, 0.1)))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/playerPage/courseExam.png', width: 15, height: 16,),
                Container(
                  child: Text('随堂考', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18),),
                  margin: EdgeInsets.only(left: 13),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(151, 151, 151, 0.1)))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/images/playerPage/afterCourseExam2.png', width: 15, height: 16,),
                      Row(
                        children: <Widget>[
                          Text('出勤后，开启', style: TextStyle(fontSize: 15, color: Color.fromRGBO(51, 51, 51, .3))),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Image.asset('assets/images/playerPage/wenhao.png', width: 17, height: 17),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 15,
                  child: Container(
                    child: Text('课后作业', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.3), fontSize: 18),),
                    margin: EdgeInsets.only(left: 13),
                  ),
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}