import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = List()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Layout'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: widgets,
              spacing: 25,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (widgets.length < 9) {
          setState(() {
            widgets.insert(widgets.length - 1, buildImage());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black26,
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.yellow,
        child: Center(
          child: Text('Image'),
        ),
      ),
    );
  }
}
