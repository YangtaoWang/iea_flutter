import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:extended_image/extended_image.dart';

class MainOpenBanner extends StatefulWidget {
  final List<IndexOpenClassModel> openClassList;
  MainOpenBanner({Key key, @required this.openClassList}) : super(key: key);

  _MainOpenBannerState createState() => _MainOpenBannerState();
}

class _MainOpenBannerState extends State<MainOpenBanner> with AutomaticKeepAliveClientMixin<MainOpenBanner>{
  @override
  bool get wantKeepAlive => true;
  @override 
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: Container(
              height: 51,
              alignment: FractionalOffset.centerLeft,
              child: Text('公开课', style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1), fontSize: 17, fontWeight: FontWeight.w500),)
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              child: AspectRatio(
                aspectRatio: 10.0 / 4.63,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ExtendedImage.network(
                    widget.openClassList[0].bannerUrl,
                    cache: true,
                    enableLoadState: false,
                    fit: BoxFit.fill
                  )
                )
              )
            ),
          )
        ],
      ),
    );
  }
}