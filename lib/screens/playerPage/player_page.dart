import 'package:flutter/material.dart';
import 'package:iea/screens/playerPage/player_teacherDes.dart';
import 'package:iea/screens/playerPage/player_courseService.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:iea/blocs/playerPage_blocs/player_bloc.dart';
class PlayerPage extends StatefulWidget {
  final int goodsId;
  final int videoId;
  final int moduleLessonId;
  PlayerPage({Key key, @required this.goodsId, @required this.videoId, @required this.moduleLessonId}) : super(key: key);
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  static VideoPlayerController videoPlayerController = VideoPlayerController.network('https://xszx-prod-1251987637.cos.ap-beijing.myqcloud.com/%E5%9B%BD%E9%99%85%E8%90%A5%E5%85%BB%E5%B8%88.mp4');
  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    aspectRatio: 16 / 9,
    autoPlay: !true,
    looping: false,
    placeholder: Image.network('https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png')
  );
  int currentTab = 1;
   PlayerBloc _bloc = PlayerBloc();
  _getPlayer(){
    Map<String, dynamic> params = {'goodsId': widget.goodsId, 'videoId': widget.videoId, 'moduleLessonId': widget.moduleLessonId};
    print(widget.goodsId);
    print(widget.videoId);
    print(widget.moduleLessonId);
    _bloc.getPlayer(params);
  }
  @override
  void initState() {
    // _getPlayer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('播放', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 210,
              decoration: BoxDecoration(
                // color: Color.fromRGBO(51, 51, 51, .3)
              ),
              child: new Chewie(
                controller: chewieController
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromRGBO(151, 151, 151, .18)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('老师', style: TextStyle(color: currentTab == 1 ? Color.fromRGBO(51, 51, 51, 1) : Color.fromRGBO(153, 153, 153, 1), fontSize: 16, fontWeight: FontWeight.w600),)
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.5),
                                color: currentTab == 1 ? Color.fromRGBO(243, 110, 34, 1) : null,
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 38),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('课程服务',style: TextStyle(color: currentTab == 2 ? Color.fromRGBO(51, 51, 51, 1) : Color.fromRGBO(153, 153, 153, 1), fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.5),
                                color: currentTab == 2 ? Color.fromRGBO(243, 110, 34, 1) : null,
                              ),
                            )
                          )
                        ],
                      )
                    )
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: currentTab == 1 ? TeacherDes() : CourseService()
            )
          ],
        ),
      )
    );
    
  }
}




