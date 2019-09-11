import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iea/sp/index.dart';
class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int clock = 3;
  bool isClock = true;
  Timer timer;

  _startClock () { // 开启定时器
    setState(() {isClock = true;});
    int time = 3;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) async{
      setState(() {clock = time;});
      time --;
      if (time < 0) {
        timer.cancel();
        if(await SP().getData('firstInstall') == null) {
          Navigator.pushReplacementNamed(context, '/guide');
          SP().saveData('firstInstall', '1');
        } else {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => route == null);
        }
      }
    });
  }

  @override
  void initState() {
    _startClock();
    super.initState();
  }
  @override 
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splashPage/first.jpeg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Positioned(
                top: 38,
                right: 17,
                child: GestureDetector(
                  onTap: () async{
                    timer?.cancel();
                    if(await SP().getData('firstInstall') == null) {
                      Navigator.pushReplacementNamed(context, '/guide');
                      SP().saveData('firstInstall', '1');
                    } else {
                      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => route == null);
                    }
                    // Navigator.pushReplacementNamed(context, '/guide');
                  },
                  child: Container(
                    alignment: FractionalOffset.center,
                    width: 66,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(clock.toString() + 's跳过', style:TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                )
              )
          ],
        )
      )
    );
  }
}