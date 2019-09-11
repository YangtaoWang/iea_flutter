import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:iea/models/openPlayerPage_models/openPlayer_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/widgets/error.dart';
import 'package:iea/widgets/loading.dart';
import 'package:video_player/video_player.dart';
import 'package:iea/blocs/openPlayerPage_blocs/openPlayer_bloc.dart';

class OpenPlayer extends StatefulWidget {
  final String openClassId;
  OpenPlayer({Key key, @required this.openClassId}) : super(key: key);
  _OpenPlayerState createState() => _OpenPlayerState();
}

class _OpenPlayerState extends State<OpenPlayer> {
  OpenPlayerModle  openPlayer;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController; 
  OpenPlayerBloc _bloc = OpenPlayerBloc();
  getOpenPlayer(){
    Map<String, String> params = {'openClassId': widget.openClassId};
    _bloc.getOpenPlayer(params);
  }
  @override
  void initState() {
    getOpenPlayer();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
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
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
            child: Container(
              width: 35,
              height: 15,
              margin: EdgeInsets.only(right: 20, top: 12, bottom: 12),
              child: Image.asset('assets/images/openDetail/actionsHome.png', width: 35, height: 15, fit: BoxFit.fill),
            )
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<BaseResp>(
      stream: _bloc.openPlayer,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot<BaseResp> snapshot){
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            openPlayer = response.data;
            return ListView(
              children: <Widget>[
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    // color: Color.fromRGBO(51, 51, 51, .3)
                  ),
                  child: openPlayer != null 
                  ? new Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.network(openPlayer.videoUrl),
                      aspectRatio: 16 / 9,
                      autoPlay: !true,
                      looping: false,
                      placeholder: Image.network(openPlayer.videoCover == null ? 'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png': openPlayer.videoCover)
                    )
                  )
                  : Container()
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: FractionalOffset.topLeft,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(openPlayer.videoName, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 24, fontWeight: FontWeight.w500), maxLines: 2,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset('assets/images/openDetail/timeFree.png', width: 65, height: 18, fit: BoxFit.cover,),
                              // Container(margin: EdgeInsets.only(left: 19), child: Text('￥' + response.data.price.toString(), style:TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1), decoration: TextDecoration.lineThrough)),)
                            ],
                          ),
                          Text((openPlayer.learnerCount/10000).toString().substring(0,3) + '万次学习', style: TextStyle(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)))
                        ],
                      )
                    ],
                  ),
                ),
              ]
            );
            } else {
            return ErrorPage();
          }
        } else {
          return LoadingPage();
        }
      },
    )
      ),
    );
  }
}