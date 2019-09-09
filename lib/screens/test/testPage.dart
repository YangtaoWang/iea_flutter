import 'package:flutter/material.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Contact _contact = new Contact(fullName: "", phoneNumber: "");
  List<Contact> _list = new List();
  final EasyContactPicker _contactPicker = new EasyContactPicker();

  _openAddressBook() async{
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    // 申请结果
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if (permission == PermissionStatus.granted){
      // _getContactData();
      _getContactlist();
    }

  }

  _getContactData() async{
    Contact contact = await _contactPicker.selectContactWithNative();
    print(contact);
    setState(() {
      _contact = contact;
    });
  }
  _getContactlist() async{
    List<Contact> list = await _contactPicker.selectContacts();
    print(list);
    setState(() {
      _list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('测试', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: new ListView(
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true, //解决无限高度问题
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          RaisedButton(
            child: Text('通讯录'),
            onPressed: () async {
              _openAddressBook();
            },
          ),
          Container(
            child: _list.length == 0 ?
            Container()
            : ListView.builder(
              shrinkWrap: true, //解决无限高度问题
              // physics:NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return _getItemWithIndex(_list[index]);
              },
              itemCount: _list.length,
            )
          )
        ],
      ),
    );
  }
}

Widget _getItemWithIndex(Contact contact){
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(contact.fullName),
          Text(contact.phoneNumber,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

