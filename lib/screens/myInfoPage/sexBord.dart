import 'package:flutter/material.dart';

class SexBord extends StatefulWidget {
  SexBord({Key key}) : super(key: key);

  _SexBordState createState() => _SexBordState();
}

class _SexBordState extends State<SexBord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 43.5,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.82),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14))
                    ),
                    alignment: FractionalOffset.center,
                    child: Text('修改性别', style: TextStyle(color: Color.fromRGBO(142, 142, 147, 1), decoration: TextDecoration.none, fontSize: 13, fontWeight: FontWeight.normal)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop('1');
                    },
                    child: Container(
                      height: 56.5,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.82),
                        border: Border(bottom: BorderSide(color: Color.fromRGBO(142, 142, 147, .2), width: .5), top: BorderSide(color: Color.fromRGBO(142, 142, 147, .2), width: .5))
                      ),
                      alignment: FractionalOffset.center,
                      child: Text('男', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1), decoration: TextDecoration.none, fontSize: 20, fontWeight: FontWeight.normal)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop('2');
                    },
                    child: Container(
                      height: 56.5,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.82),
                        border: Border(bottom: BorderSide(color: Color.fromRGBO(142, 142, 147, .2), width: .5))
                      ),
                      alignment: FractionalOffset.center,
                      child: Text('女', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1), decoration: TextDecoration.none, fontSize: 20, fontWeight: FontWeight.normal)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop('3');
                    },
                    child: Container(
                      height: 56.5,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.82),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14))
                      ),
                      alignment: FractionalOffset.center,
                      child: Text('保密', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1), decoration: TextDecoration.none, fontSize: 20, fontWeight: FontWeight.normal)),
                    )
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop('0');
                },
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromRGBO(255, 255, 255, 0.82)
                  ),
                  alignment: FractionalOffset.center,
                  child: Text('取消', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1), decoration: TextDecoration.none, fontSize: 20, fontWeight: FontWeight.normal)),
                )
              )
            ],
          ),
        ),
      )
      
    );
  }
}