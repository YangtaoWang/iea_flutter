import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/resource/policyPage_api_provider.dart';
import 'package:iea/models/policyPage_models/policy_model.dart';

class PolicyPage extends StatefulWidget {
  final String type;
  PolicyPage({Key key, @required this.type}) : super(key: key);
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  String html;
  _getPolicy() async{
    Map<String, String>  params = {'type': widget.type};
    BaseResp data = await PolicyPageApiProvider().getPolicy(params);
    if (data.code == 200) {
      setState(() {
        html = PolicyInfo.fromJson(data.data).content;
      });
    }
  }
  @override
  void initState() {
    _getPolicy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.type == '1' ? 'IEA认证协议' : '隐私政策', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
            data: html == null ? '<p></p>' : html
          )
        ),
      )
    );
  }
}