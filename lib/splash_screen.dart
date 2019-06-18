import 'package:flutter/material.dart';
import 'package:flutter_navitagor_anim/right_back.dart';

import 'bezier_line.dart';
import 'draggable_demo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DraggableDemo()),
            (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Image.network(
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2096303063,1418382063&fm=26&gp=0.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
