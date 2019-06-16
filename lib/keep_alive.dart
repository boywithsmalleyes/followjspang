import 'package:flutter/material.dart';

import 'keep_alive_tab_view.dart';

class KeepAlivePage extends StatefulWidget {
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Alive Demo'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              child: Text('111'),
              icon: Icon(Icons.home),
            ),
            Tab(
              child: Text('222'),
              icon: Icon(Icons.hotel),
            ),
            Tab(
              child: Text('333'),
              icon: Icon(Icons.cake),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(
            child: KeepAliveTabView(),
          ),
          Center(
            child: KeepAliveTabView(),
          ),
          Center(
           child: KeepAliveTabView(),
          ),
        ],
      ),
    );
  }
}
