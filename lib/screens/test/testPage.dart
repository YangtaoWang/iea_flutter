import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// class TestPage extends StatefulWidget {
//   TestPage({Key key}) : super(key: key);

//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   Contact _contact = new Contact(fullName: "", phoneNumber: "");
//   List<Contact> _list = new List();
//   final EasyContactPicker _contactPicker = new EasyContactPicker();

//   _openAddressBook() async{
//     // 申请权限
//     Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
//     // 申请结果
//     PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
//     if (permission == PermissionStatus.granted){
//       // _getContactData();
//       _getContactlist();
//     }

//   }

//   _getContactData() async{
//     Contact contact = await _contactPicker.selectContactWithNative();
//     print(contact);
//     setState(() {
//       _contact = contact;
//     });
//   }
//   _getContactlist() async{
//     List<Contact> list = await _contactPicker.selectContacts();
//     print(list);
//     setState(() {
//       _list = list;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text('测试', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: new ListView(
//         padding: EdgeInsets.all(8.0),
//         shrinkWrap: true, //解决无限高度问题
//         physics: NeverScrollableScrollPhysics(),
//         children: <Widget>[
//           RaisedButton(
//             child: Text('通讯录'),
//             onPressed: () async {
//               _openAddressBook();
//             },
//           ),
//           Container(
//             child: _list.length == 0 ?
//             Container()
//             : ListView.builder(
//               shrinkWrap: true, //解决无限高度问题
//               // physics:NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index){
//                 return _getItemWithIndex(_list[index]);
//               },
//               itemCount: _list.length,
//             )
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 child: Container(color: Colors.cyan, height: 80),
//                 flex: 1,
//               ),
//               Expanded(
//                 child: Container(color: Colors.indigoAccent, height: 80),
//                 flex: 2,
//               ),
//               Expanded(
//                 child: Container(color: Colors.orange, height: 80),
//                 flex: 4,
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Flexible(
//                 child: Container(color: Colors.cyanAccent, height: 80, width: 80),
//                 flex: 1
//               ),
//               Flexible(
//               child: Container(color: Colors.indigoAccent, height: 80, width: 80),
//                 flex: 2,
//                 fit: FlexFit.tight,
//               ),
//               Flexible(
//                 child: Container(color: Colors.orange, height: 80, width: 80),
//                 flex: 4,
//                 // fit: FlexFit.tight,
//               ),
//             ],
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints.tight(Size(double.infinity, 256)),
//             child: Stack(
//               alignment: AlignmentDirectional.center,
//               children: <Widget>[
//                 Positioned(
//                   top: 0.0,
//                   child: Icon(Icons.calendar_today,
//                       size: 128.0, color: Colors.lightBlueAccent),
//                 ),
//                 Positioned(
//                     top: 4,
//                     right: 110,
//                     child: CircleAvatar(radius: 16, backgroundColor: Colors.red)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget _getItemWithIndex(Contact contact){
//     return Container(
//       height: 45,
//       padding: EdgeInsets.only(left: 13),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(contact.fullName),
//           Text(contact.phoneNumber,
//             style: TextStyle(
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }



// class TestPage extends StatefulWidget {
//   TestPage({Key key}) : super(key: key);

//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> with TickerProviderStateMixin{
//   TabController tabController;
//   var tabs = <Tab>[
//     Tab( text: '左侧'),
//     Tab( text: '右侧'),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // elevation: 0,
//       ),
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               centerTitle: true,    //标题居中
//               expandedHeight: 400.0,  //展开高度200
//               floating: false,  //不随着滑动隐藏标题
//               pinned: true,   //固定在顶部
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 title: TabBar(
//                   tabs: tabs,
//                   controller: tabController,
//                 ),
//                 // title: Text('我是一个FlexibleSpaceBar'),
//                 background: Image.network(
//                   "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               // bottom: TabBar(
//               //   tabs: [
//               //     Tab(icon: Icon(Icons.cake), text: '左侧'),
//               //     Tab(icon: Icon(Icons.golf_course), text: '右侧'),
//               //   ],
//               //   controller: TabController(length: 2, vsync: this),
//               // ),
//             ),
//             // SliverPersistentHeader(
//             //   pinned: true,
//             //   delegate: _SliverAppBarDelegate(
//             //   TabBar(
//             //   labelColor: Colors.red,
//             //   unselectedLabelColor: Colors.grey,
//             //   tabs: [
//             //     Tab(icon: Icon(Icons.cake), text: '左侧'),
//             //     Tab(icon: Icon(Icons.golf_course), text: '右侧'),
//             //   ],
//             //   controller: TabController(length: 2, vsync: this),
//             // )))
//           ];
//         },
//         body: TabBarView(
//           controller: tabController, //配置控制器
//           children: tabs.map(
//             (Tab tab) =>
//             Container(
//               child: ListView.builder(
//                 itemBuilder: _itemBuilder,
//                 itemCount: 15,
//               ),
//             )
//           ).toList()    
//         )
//       )
//         // body: Center(
//         //   child: ListView.builder(
//         //     itemBuilder: _itemBuilder,
//         //     itemCount: 15,
//         //   ),
//         // )),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       child: _tabBar,
//       color: Colors.white
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

// Widget _itemBuilder(BuildContext context, int index) {
//   return ListTile(
//     leading: Icon(Icons.android),
//     title: Text('无与伦比的标题+$index'),
//   );
// }


// class TestPage extends StatefulWidget {
//   TestPage({Key key}) : super(key: key);

//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> with TickerProviderStateMixin{
//   TabController tabController;
//   var tabs = <Tab>[
//     Tab(
//       child: Container(
//         // width: 200, 
//         // height: 20, 
//         // decoration: BoxDecoration(color: Colors.black),
//         alignment: FractionalOffset.centerLeft, 
//         child: Text('左边', style: TextStyle(color: Colors.black),)
//       )
//     ),
//     Tab(
//       child: Container(
//         // width: 200, 
//         // height: 20, 
//         // decoration: BoxDecoration(color: Colors.blue), 
//         child: Text('右边', style: TextStyle(color: Colors.black),)
//       )
//     )
//   ];
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//     tabController.addListener((){
//       print(tabController.index);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             width: 200,
//             child: TabBar(
//               tabs: tabs,
//               indicatorColor: Colors.white,
//               controller: tabController,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               child: TabBarView(
//                 controller: tabController, //配置控制器
//                 // children: tabs.map(
//                 //   (Tab tab) =>
//                 //   Container(
//                 //     child: ListView.builder(
//                 //       itemBuilder: _itemBuilder,
//                 //       itemCount: 15,
//                 //     ),
//                 //   )
//                 // ).toList()    
//                 children: <Widget>[
//                   ListView.builder(
//                     physics: new NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 10,
//                     itemBuilder: (context, index){
//                       return Container(
//                         margin: EdgeInsets.only(top: 24),
//                         padding: EdgeInsets.only(left: 40, right: 70),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Text('文章标题文章标题文章标题文章', style: TextStyle(color: Color.fromRGBO(50, 50, 50, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),
//                             Container(
//                               margin: EdgeInsets.only(top: 5),
//                               child: Text('摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(top: 8),
//                               child: Text('09-16', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: new NeverScrollableScrollPhysics(),
//                     itemCount: 10,
//                     itemBuilder: (context, index){
//                       return Container(
//                         padding: EdgeInsets.only(left: 40, right: 70),
//                         margin: EdgeInsets.only(top: 24),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Text('另外的文章标题', style: TextStyle(color: Color.fromRGBO(50, 50, 50, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),
//                             Container(
//                               margin: EdgeInsets.only(top: 5),
//                               child: Text('摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(top: 8),
//                               child: Text('09-16', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               )
//             )
//           )
//         ],
//       ),
//     );
//   }
// }




import 'package:extended_image/extended_image.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PageController pageController = new PageController();
  int currentIndex = 0;
  double height;
  GlobalKey stackKey = GlobalKey();
  List<Widget> _list = [
    ListView.builder(
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(top: 24),
          padding: EdgeInsets.only(left: 40, right: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('文章标题文章标题文章标题文章', style: TextStyle(color: Color.fromRGBO(50, 50, 50, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text('摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text('09-16', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
              )
            ],
          ),
        );
      },
    ),
    ListView.builder(
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.only(left: 40, right: 70),
          margin: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('另外的文章标题', style: TextStyle(color: Color.fromRGBO(50, 50, 50, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text('摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50字摘要50', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text('09-16', style: TextStyle(color: Color.fromRGBO(38, 38, 38, .5), fontSize: 12, letterSpacing: 2))
              )
            ],
          ),
        );
      },
    )
  ];
  _afterLayout(_) {
    final RenderBox renderBoxRed = stackKey.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
    setState(() {
      height = sizeRed.height;
    });
  }

  _buildStack() {
    Widget firstElement;
    if (height == null) {
      firstElement = Container();
    } else {
      firstElement = Container(
        height: height,
        child: PageView(
          onPageChanged: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          controller: pageController,
          children: _list,
        ),
      );
    }

    return IndexedStack(
      key: stackKey,
      children: <Widget>[
        firstElement,
        ..._list,
      ],
    );
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 251, 238, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 251, 238, 1),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        child: Text('saf'),
        elevation: 5,
        onPressed: (){

        },
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 70),
              margin: EdgeInsets.only(bottom: 34),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 4, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 2))],
                        ),
                        margin: EdgeInsets.only(right: 22),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
                            cache: true,
                            enableLoadState: false,
                            fit: BoxFit.fill
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('作者昵称作者昵称作者昵称作者昵称作者昵称', style: TextStyle(fontSize: 15, color: Color.fromRGBO(50, 50, 50, 1), fontWeight: FontWeight.w600, letterSpacing: 2), maxLines: 1,),
                            Container(
                              // margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('所属分类', style: TextStyle(fontSize: 12, color: Color.fromRGBO(38, 38, 38, .5), letterSpacing: 2), maxLines: 1,),
                                  // true
                                  // ? 
                                  FlatButton(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      width: 63,
                                      height: 24,
                                      alignment: FractionalOffset.center,
                                      child: Text('关注', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 12, letterSpacing: 2),),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(width: 1, color: Color.fromRGBO(50, 50, 50, 1), style: BorderStyle.solid)
                                      ),
                                    ),
                                    onPressed: (){
                                    },
                                  )
                                  // : Container(
                                  //     width: 63,
                                  //     height: 24,
                                  //     alignment: FractionalOffset.center,
                                  //     child: Text('已关注', style: TextStyle(fontSize: 12, color: Color.fromRGBO(38, 38, 38, .5), fontWeight: FontWeight.w600, letterSpacing: 2)),
                                  // )
                                ],
                              ),
                            ),
                            Text('作者简介30字作者简介30字作者简介30字作者简介30字作者作者简介30字作者简介30字作者', style: TextStyle(fontSize: 12, color: Color.fromRGBO(38, 38, 38, .5), letterSpacing: 2))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 46,
                    margin: EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('文章', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 12, letterSpacing: 2),),
                            Text('243', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('粉丝', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 12, letterSpacing: 2),),
                              Text('2343', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('赞赏', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 12, letterSpacing: 2),),
                              Text('2343', style: TextStyle(color: Color.fromRGBO(38, 38, 38, 1), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600))
                            ],
                          ),
                        )
                      ],
                    )
                  )
                  
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              maxHeight: 40,
              minHeight: 40,
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 251, 238, 1)
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        this.setState((){
                          currentIndex = 0;
                        });
                        pageController.jumpToPage(0);
                      },
                      child: Text('最热', style: TextStyle(color: currentIndex == 0 ? Color.fromRGBO(38, 38, 38, 1) : Color.fromRGBO(38, 38, 38, .3), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),
                    ),
                    GestureDetector(
                      onTap: (){
                        this.setState((){
                          currentIndex = 1;
                        });
                        pageController.jumpToPage(1);
                      },
                      child: Container(margin: EdgeInsets.only(left: 30), child: Text('最新', style: TextStyle(color: currentIndex == 1 ? Color.fromRGBO(38, 38, 38, 1) : Color.fromRGBO(38, 38, 38, .3), fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600)),)
                    )
                  ],
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: _buildStack()
          )
        ],
      )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}


// class CarouselVariableHight extends StatefulWidget {
//   @override
//   CarouselVariableHightState createState() => CarouselVariableHightState();
// }

// final widgetHeights = <double>[
//   Random().nextInt(300).toDouble(),
//   Random().nextInt(300).toDouble(),
//   Random().nextInt(300).toDouble(),
//   Random().nextInt(300).toDouble(),
// ];

// class CarouselVariableHightState extends State<CarouselVariableHight> {
//   double height;
//   GlobalKey stackKey = GlobalKey();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
//     super.initState();
//   }

//   _afterLayout(_) {
//     final RenderBox renderBoxRed = stackKey.currentContext.findRenderObject();
//     final sizeRed = renderBoxRed.size;
//     setState(() {
//       height = sizeRed.height;
//     });
//   }

//   final caruselItems = widgetHeights
//       .map((height) => Column(children: [
//             Container(
//                 color: Colors.red,
//                 height: Random().nextInt(300).toDouble(),
//                 child: Text('Text with random length'))
//           ]))
//       .toList();

//   _buildStack() {
//     Widget firstElement;
//     if (height == null) {
//       firstElement = Container();
//     } else {
//       firstElement = Container(
//         height: height,
//         child: PageView(
//           children: caruselItems,
//         ),
//       );
//     }

//     return IndexedStack(
//       key: stackKey,
//       children: <Widget>[
//         firstElement,
//         ...caruselItems,
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel')),
//       body: ListView(
//         children: <Widget>[
//           Text('My Carousel'),
//           _buildStack(),
//           Text('end of List'),
//         ],
//       ),
//     );
//   }
// }