import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _StateExpansionTileDemo createState() => _StateExpansionTileDemo();
}

class _StateExpansionTileDemo extends State<ExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    int _expandIndex = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text("ExpansionTileDemo"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text("Expansion Tile Test"),
              leading: Icon(Icons.ac_unit),
              onExpansionChanged: (expand) {
                print(expand ? index : _expandIndex);
                if (expand) {
                  setState(() {
                    _expandIndex = index;
                  });
                }
              },
              initiallyExpanded: _expandIndex == index ? true : false,
              children: <Widget>[
                ListTile(
                  title: Text(('Expansion child tile')),
                  subtitle: Text("sub title"),
                ),
                ExpansionTile(
                  title: Text("Expansion Tile Test"),
                  leading: Icon(Icons.account_circle),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("Expansion Tile Test"),
                      leading: Icon(Icons.account_circle),
                      children: <Widget>[
                        ExpansionTile(
                          title: Text("Expansion Tile Test"),
                          leading: Icon(Icons.account_circle),
                          children: <Widget>[
                            ListTile(
                              title: Text(('Expansion child tile')),
                              subtitle: Text("sub title"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          itemCount: 5,
        ));
  }
}
