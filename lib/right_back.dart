import 'package:flutter/cupertino.dart';

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: CupertinoColors.activeOrange,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return RightBackDemo();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
