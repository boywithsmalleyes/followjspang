import 'package:flutter/material.dart';
import 'package:flutter_navitagor_anim/search_bar.dart';

import 'Constant.dart';
import 'custome_route.dart';
import 'frosted_glass.dart';
import 'keep_alive.dart';
import 'wrap_page.dart';
void main() => runApp(MaterialApp(
      title: "Flutter Navigator",
      home: FrostedPage(),
    ));

 class FrostedPage extends StatelessWidget {
  const FrostedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_next, size: 36.0,),
          onPressed: () {
            Navigator.push(context, CustomeRoute(SecondPage(), Constants.SLIDE_ROUTE_ANIMATION));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('Second Page'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
