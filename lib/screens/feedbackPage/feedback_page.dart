import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iea/widgets/style_widget.dart';
import 'package:iea/blocs/feedbackPage_blocs/postFeedback_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/provider/base/base_resp.dart';
class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool isHighlight = false;
  FeedbackBloc _bloc = new FeedbackBloc();
  _postFeedback(){
    Map<String, String> params = {'type': '1', 'phone': _controller2.text, 'feedback': _controller.text};
    _bloc.postFeedback(params);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('意见反馈', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _bloc.feedbackStream,
          builder: (context, AsyncSnapshot<BaseResp> snapshot) {
            print(snapshot.data?.code);
            if(snapshot.data?.code == 200){
              Fluttertoast.showToast(
                msg: "提交成功",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 1,
                backgroundColor: Color.fromRGBO(0, 0, 0, .5),
                textColor: Colors.white,
                fontSize: 16.0
              );
              _controller.text = _controller2.text = '';
              snapshot.data?.code = null;
            }
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 176,
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    padding: EdgeInsets.only(top: 3, left: 12, right: 12, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        ),
                        hintText: '告诉我们您遇到的问题，我们会在第一时间处理',
                        hintStyle: TextStyle(color: Color.fromRGBO(102, 102, 102, 0.4), fontSize: 16),
                        disabledBorder: InputBorder.none,
                        enabledBorder:  InputBorder.none,
                        focusedBorder:   InputBorder.none,
                      ),
                      cursorColor: Color.fromRGBO(51, 51, 51, 1),
                      maxLength: 500,
                      maxLines: 8,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          isHighlight = (_controller.text.length > 0 && _controller2.text.length > 0);
                        });
                      },
                    ),  
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Text.rich(TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:'*',
                                style: TextStyle(fontSize: 15, color: CW.c1),
                              ),
                              TextSpan(
                                text:'联系方式',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              )
                            ]
                          ))
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _controller2,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide.none
                              ),
                              hintText: '手机号/微信号',
                              hintStyle: TextStyle(color: Color.fromRGBO(102, 102, 102, 0.4), fontSize: 16),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                              disabledBorder: InputBorder.none,
                              enabledBorder:  InputBorder.none,
                              focusedBorder:   InputBorder.none,
                              counterText: ''
                            ),
                            cursorColor: Color.fromRGBO(51, 51, 51, 1),
                            maxLength: 30,
                            inputFormatters: [BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))],
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                isHighlight = (_controller.text.length > 0 && _controller2.text.length > 0);
                              });
                            },
                          ),
                        )
                        
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_controller.text.length == 0 || _controller2.text.length == 0 ) return;
                      _postFeedback();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 236),
                      alignment: Alignment.center,
                      height: 50,
                      width: 322,
                      child: Text('提交反馈', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
                      decoration: BoxDecoration(
                        color: isHighlight ? Color.fromRGBO(243, 110, 34, 1) : Color.fromRGBO(243, 110, 34, .5),
                        borderRadius: BorderRadius.circular(5)
                      ),
                    )
                  )
                  
                ],
              )
            );
          },
        )
      )
    );
  }
}