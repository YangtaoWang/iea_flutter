import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:iea/screens/openDetailPage/openDetail_page.dart';

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
    return widget.openClassList.length == 0 ? Container() :
    GestureDetector(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return OpenDetailPage(openClassId: widget.openClassList[0].openClassId.toString());
        }));
      },
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
      )
    );
    
  }
}