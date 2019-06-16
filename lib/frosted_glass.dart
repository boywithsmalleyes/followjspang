import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassWidget extends StatelessWidget {
  const FrostedGlassWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network("https://inews.gtimg.com/newsapp_bt/0/9356079999/641"),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  child: Center(
                    child: Text(
                      'XiaoMan',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                  width: 500.0,
                  height: 800.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
