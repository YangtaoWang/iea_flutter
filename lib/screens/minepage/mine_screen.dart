import 'package:flutter/material.dart';
// import 'package:iea/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/appActions.dart';
import 'package:iea/redux/appState.dart';
// import 'package:iea/redux/AppReducer.dart';

class MineScreen extends StatefulWidget {
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(LoginSuccessAction(token: 'new Token'));
        },
        builder: (context, callback) {
          return GestureDetector(
            onTap: callback,
            child: Text('PagesScreen'),
          );
        },
        )
        
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState,int>(
              converter: (store) => store.state.count.counter,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            // StoreConnector<AppState, String>(
            //   // converter: (store) => store.state.globalState.token,
            //   builder: (context, token) {
            //     return Text(
            //       token.toString(),
            //       style: Theme.of(context).textTheme.display1,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(AppActions.Increase);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increase',
            child: new Icon(Icons.add),
          );
        },
      )
    );
  }
}
