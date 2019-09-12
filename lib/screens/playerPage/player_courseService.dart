import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iea/screens/courseExamPage/courseExam_page.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:iea/provider/resource/playerPage_api_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
class CourseService extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return CourseServiceState();
  }
}

class CourseServiceState extends State<CourseService>{
  // ProgressDialog pr;
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
  getSaveDir() async {
    var _localPath = await _findLocalPath() + '/Download';
    final savedDir = Directory(_localPath);
    // 判断下载路径是否存在
    bool hasExisted = await savedDir.exists();
    // 不存在就新建路径
    if (!hasExisted) {
      savedDir.create();
    }
    return _localPath;
  }
  Future<bool> _openDownloadedFile(taskId) {
    return FlutterDownloader.open(taskId: taskId);
  }

  // 根据 downloadUrl 和 savePath 下载文件
  _downloadFile(savePath) async {
    await FlutterDownloader.enqueue(
      url: 'https://dldir1.qq.com/qqfile/qq/PCQQ9.1.5/25530/QQ9.1.5.25530.exe',
      // url: 'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
      savedDir: savePath,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );
    print('下载完成');
  }
  // _downLoad(url, saveUrl) {
  //   PlayerPageApiProvider().download(url, saveUrl);
  // }

  @override 
  void initState() {
    super.initState();
    ProgressDialog pr = new ProgressDialog(context, ProgressDialogType.Download);
    pr.setMessage('下载中…');
    // 设置下载回调
    FlutterDownloader.registerCallback((id, status, progress) {
      // 打印输出下载信息
      print('Download task ($id) is in status ($status) and process ($progress)');
      if (!pr.isShowing()) {
        pr.show();
      }
      if (status == DownloadTaskStatus.running) {
        pr.update(progress: progress.toDouble(), message: "下载中，请稍后…");
      }
      if (status == DownloadTaskStatus.failed) {
        // fluttertoas("下载异常，请稍后重试");
        if (pr.isShowing()) {
          pr.hide();
        }
      }
      if (status == DownloadTaskStatus.complete) {
        print(pr.isShowing());
        if (pr.isShowing()) {
          pr.hide();
        }
        showDialog(
          // 设置点击 dialog 外部不取消 dialog，默认能够取消
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: Text('提示'),
            // 标题文字样式
            content: Text('文件下载完成，是否打开？'),
            // 内容文字样式
            backgroundColor: CupertinoColors.white,
            elevation: 8.0,
            // 投影的阴影高度
            semanticLabel: 'Label',
            // 这个用于无障碍下弹出 dialog 的提示
            shape: Border.all(),
            // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
            actions: <Widget>[
              // 点击取消按钮
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('取消')),
              // 点击打开按钮
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // 打开文件
                    _openDownloadedFile(id).then((success) {
                      if (!success) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Cannot open this file')));
                      }
                    });
                  },
                  child: Text('打开')),
            ],
          ));
      }
    });
  }

  @override 
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              if (await _checkPermission()) {
                // var _localPath = await _findLocalPath();
                // 获取存储路径
                // var _localPath = (await _findLocalPath()) + '/Download';
                // print(_localPath);
                // _downLoad('https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/file/025a6a29-c746-451c-b88e-bc86aa65fe1c.png', _localPath);
                // final savedDir = Directory(_localPath);
                // // 判断下载路径是否存在
                // bool hasExisted = await savedDir.exists();
                // // 不存在就新建路径
                // if (!hasExisted) {
                //   savedDir.create();
                // }
                var savedDir = await getSaveDir();
                _downloadFile(savedDir);
              } 
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context){
                return CourseExamPage(isExaming: true, currentPage: 0);
              }));
            },
            child: Container(
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