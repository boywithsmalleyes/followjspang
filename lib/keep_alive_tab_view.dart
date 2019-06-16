import 'package:flutter/material.dart';

class KeepAliveTabView extends StatefulWidget {
  @override
  _KeepAliveTabViewState createState() => _KeepAliveTabViewState();
}

class _KeepAliveTabViewState extends State<KeepAliveTabView>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  void _increamentCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('点击 + 增加计数'),
            Text('$_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increamentCounter,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
