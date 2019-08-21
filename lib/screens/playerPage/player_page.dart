import 'package:flutter/material.dart';
import 'package:iea/screens/playerPage/player_teacherDes.dart';
import 'package:iea/screens/playerPage/player_courseService.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class PlayerPage extends StatefulWidget {
  PlayerPage({Key key}) : super(key: key);
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  static VideoPlayerController videoPlayerController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4');
  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: true,
  );
  int currentTab = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 210,
            decoration: BoxDecoration(
              // color: Color.fromRGBO(51, 51, 51, .3)
            ),
            child: new Chewie(
              controller: chewieController,
                // new VideoPlayerController.network(this.url),
                // aspectRatio: 16 / 9,
                // autoPlay: !true,
                // looping: true,
                // showControls: true,
                // // 占位图
                // placeholder: new Container(
                //     color: Colors.grey,
                // ),

                // // 是否在 UI 构建的时候就加载视频
                // autoInitialize: !true,

                // // 拖动条样式颜色
                // materialProgressColors: new ChewieProgressColors(
                //     playedColor: Colors.red,
                //     handleColor: Colors.blue,
                //     backgroundColor: Colors.grey,
                //     bufferedColor: Colors.lightGreen,
                // ),
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
    );
  }
}




