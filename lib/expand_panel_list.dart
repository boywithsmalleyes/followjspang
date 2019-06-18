import 'package:flutter/material.dart';

class ExpandPanelListDemo extends StatefulWidget {
  @override
  _ExpandPanelListDemoState createState() => _ExpandPanelListDemoState();
}

class _ExpandPanelListDemoState extends State<ExpandPanelListDemo> {


  List<int> list;

  List<ExpandStateBean> expandStateList;

  _ExpandPanelListDemoState() {
    list = List();
    expandStateList = List();
    for (int i = 0; i < 20; i++) {
      list.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpandPanelListDemo"),),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              expandStateList.forEach((item) {
                if (item.index == index) {
                  item.isOpen = !isExpanded;
                } else {
                  item.isOpen = isExpanded;
                }
              });
            });
          },
          children: list.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(("Expand Title No.$index")),
                  );
                },
                body: ListTile(title: Text("Expand Body No.$index"),),
                isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }


}

class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index, this.isOpen);
}
