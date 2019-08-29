import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/sp/index.dart';
import 'package:iea/models/loginPage_models/userInfo_model.dart';
import 'dart:convert' as convert;
import 'package:iea/screens/myInfoPage/sexBord.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:iea/provider/resource/myInfoPage_api_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
// import 'package:iea/blocs/settingPage_blocs/uploadImg.dart';
import 'package:extended_image/extended_image.dart';
import 'package:iea/provider/resource/settingPage_api_provider.dart';


class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key key}) : super(key: key);
  _MyInfoPageState createState() => _MyInfoPageState();
}


class _MyInfoPageState extends State<MyInfoPage> {
  TextEditingController controller = TextEditingController();
  String userImg;
  String userName;
  String userSex;
  int userId;
  DateTime _dateTime;
  // File _image;
  // UploadImgBloc _bloc = UploadImgBloc();
  _postImg(FormData formdata) async{
    // _bloc.upLoadImg(formdata);
    BaseResp res = await  SettingPageApiProvider().upLoadImg(formdata);
    if (res.code == 200) {
      Fluttertoast.showToast(msg: '图片上传成功', toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
      setState(() {
        userImg = res.data;
      });
    } else {
      Fluttertoast.showToast(msg: '图片上传失败', toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
    }

  }
  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    await _cropImage(image);
  }
  Future<Null> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    print('裁剪完成');
    _fileToFormData(croppedFile);
  }
  _fileToFormData(File image) async {
    String path = image.path;
    // print(path);
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.from({
      "file": new UploadFileInfo(new File(path), name,
          contentType: ContentType.parse("image/$suffix"))
    });
    _postImg(formData);
  }

  _getUserInfo() async{
    String res = await SP().getData('userInfo');
    UserInfo userInfo = UserInfo.fromJson(convert.jsonDecode(res));
    setState(() {
      userImg = userInfo.headImg;
      userName = userInfo.username;
      userSex = userInfo.sex.toString();
      userId = userInfo.id;
      _dateTime = userInfo.birthday != null ? DateTime.parse(userInfo.birthday) : userInfo.birthday;
      controller.text = userInfo.username.toString();
    });
  }
  _showSex (BuildContext context) async { // 调起性别弹窗
    var result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogController) {
        return SexBord();
      },
    );
    print("result = $result");
    if (result != '0') {
      setState(() {
        userSex = result;
      });
    }
  }
  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        itemTextStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 13),
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 16)),
        cancel: Text('取消', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 16)),
      ),
      minDateTime: DateTime.parse('1990-01-01'),
      maxDateTime: new DateTime.now(),
      initialDateTime: _dateTime == null ? _dateTime : DateTime.parse(_dateTime.toString()),
      dateFormat: 'yyyy年-MMMM月-dd日',
      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }
  _changeUserInfo(headImg, sex, username, birthday) async{
    Map<String, String>  params = {'id': userId.toString(), 'headImg': headImg, 'sex': sex, 'username': username,'birthday': birthday};
    BaseResp data = await MyInfoPageApiProvider().changeUserInfo(params);
    _showToastByCode(data.code);
    data.code == 200 && await _saveOkActions();
    Navigator.of(context).pop();
  }
  _showToastByCode(code) {
    Map<String, String> infos = {
      '200': '信息修改成功',
      '11002': '昵称只能含中英文、数字、“_”、“-”',
      '11003': '昵称敏感关键字',
      '11004': '用户昵称已存在，换一个试试'
    };
    print(code);
    if (infos[code.toString()] != null) {
      Fluttertoast.showToast(msg: infos[code.toString()], toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
    }
  }
  _saveOkActions() async{
    String res = await SP().getData('userInfo');
    UserInfo userInfo = UserInfo.fromJson(convert.jsonDecode(res));
    userInfo.headImg = userImg;
    userInfo.username = userName;
    userInfo.sex = userSex;
    userInfo.birthday = _dateTime.toString();
    await SP().saveData('userInfo', convert.jsonEncode(userInfo));
  }
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('个人信息', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
              _changeUserInfo(userImg, userSex, userName, _dateTime.toString());
            },
            child: Container(
              margin: EdgeInsets.only(right: 16, top: 15),
              child: Text('完成', style: TextStyle(fontSize: 17, color: Color.fromRGBO(51, 51, 51, 1))),
            )
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _getImage();
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color.fromRGBO(151, 151, 151, .3), width: .3))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('头像', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 15)),
                      Container(
                        width: 51,
                        height: 51,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.5),
                          child: userImg != null ? ExtendedImage.network(
                            userImg,
                            cache: true,
                            enableLoadState: false,
                            fit: BoxFit.cover
                          ) : Image.asset('assets/images/mypage/icon_me_bg.png', width: 51, height: 51, fit: BoxFit.cover,)
                        ),
                      )
                      // ClipOval(
                      //   child: userImg != null ? Image.network(userImg, width: 51, height: 51, fit: BoxFit.cover,) : Image.asset('assets/images/mypage/icon_me_bg.png', width: 51, height: 51, fit: BoxFit.cover,),
                      // ),
                    ],
                  ), 
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color.fromRGBO(151, 151, 151, .3), width: .3))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('昵称', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 15)),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: controller,
                        textAlign: TextAlign.right,
                        // inputFormatters:<TextInputFormatter>[
                        //   WhitelistingTextInputFormatter
                        // ],
                        onChanged: (text) {
                          setState(() {
                            userName = controller.text;
                          });
                        },
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp('[A-Za-z0-9\u4e00-\u9fa5-_]'))
                        ],
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        )
                      )
                    )
                  ],
                ), 
              ),
              GestureDetector(
                onTap: () {
                  _showSex(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color.fromRGBO(151, 151, 151, .3), width: .3))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('性别', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 15)),
                      Row(
                        children: <Widget>[
                          Text(userSex == null ? '请选择': userSex == '3' ? '保密' : userSex == '1' ? '男' : '女', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
                          Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,)
                        ],
                      )
                    ],
                  ), 
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showDatePicker();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide.none)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('出生日期', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 15)),
                      Row(
                        children: <Widget>[
                          Text(_dateTime == null ? '请选择' : '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')}', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
                          Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,)
                        ],
                      )
                    ],
                  ), 
                )
              )
            ],
          ),
        )
      ),
    );
  }
}