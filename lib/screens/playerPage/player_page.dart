import 'package:flutter/material.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/screens/playerPage/player_teacherDes.dart';
import 'package:iea/screens/playerPage/player_courseService.dart';
import 'package:chewie/chewie.dart';
import 'package:iea/sp/index.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:video_player/video_player.dart';
import 'package:iea/blocs/playerPage_blocs/player_bloc.dart';
import 'package:iea/models/playerPage_modles/player_model.dart';
import 'package:iea/provider/resource/playerPage_api_provider.dart';
class PlayerPage extends StatefulWidget {
  final int goodsId;
  final int videoId;
  final int moduleLessonId;
  PlayerPage({Key key, @required this.goodsId, @required this.videoId, @required this.moduleLessonId}) : super(key: key);
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  PlayerModle player;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  int currentTab = 1;
  _getPlayer() async{
    Map<String, String> params = {'goodsId': widget.goodsId.toString(), 'videoId': widget.videoId.toString(), 'moduleLessonId': widget.moduleLessonId.toString()};
    // _bloc.getPlayer(params);
    BaseResp data = await PlayerPageApiProvider().getPlayer(params);
    if (data.code == 200) {
      setState(() {
        player = PlayerModle.fromJson(data.data);
      });
    }

  }
  // _initVideo(){
  //   videoPlayerController = VideoPlayerController.network(player.videoUrl);
  //   chewieController = ChewieController(
  //     videoPlayerController: videoPlayerController,
  //     aspectRatio: 16 / 9,
  //     autoPlay: !true,
  //     looping: false,
  //     placeholder: Image.network(player.videoCover)
  //   );
  // }
  // @override 
  void deactivate() async{
    if(await SP().getData('a') != null){ // 避免401跳转时，循环调用
      _getPlayer();
    }
    super.deactivate();
  }
  @override
  void initState() {
    _getPlayer();
    // _initVideo();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
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
              child: player != null 
              ? new Chewie(
                controller: ChewieController(
                  videoPlayerController: VideoPlayerController.network(player.videoUrl),
                  aspectRatio: 16 / 9,
                  autoPlay: !true,
                  looping: false,
                  placeholder: Image.network(player.videoCover == null ? 'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png': player.videoCover)
                )
              )
              : Container()
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
              child: currentTab == 1 ? TeacherDes(player: player,) : CourseService()
            )
          ],
        ),
      )
    );
    
  }
}




