import 'package:flutter/material.dart';
import 'package:flutter_navitagor_anim/assets.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
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
        leading: Icon(Icons.account_circle),
        title: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            child: TabBar(
              controller: _controller,
              tabs: <Widget>[
                Text(
                  "快递",
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                Text(
                  "便利店",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            height: 80.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarAction());
            },
          ),
        ],
      ),
    );
  }
}

class SearchBarAction extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return List.generate(
        1,
        (index) => IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                if (defaultSearch
                        .where((input) =>
                            input.startsWith(query.substring(0, query.length)))
                        .toList()
                        .length ==
                    0) {
                  defaultSearch.insert(0, query);
                  print(defaultSearch.toString());
                }
                query = "";
                showSuggestions(context);
              },
            ));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.green,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final buildSuggestion = query.isEmpty
        ? defaultSearch
        : searchArray
            .where((input) => input.contains(query.substring(0, query.length)))
            .toList();

    return ListView.builder(
        itemCount: buildSuggestion.length,
        itemBuilder: (context, index) => ListTile(
              title: Text("${buildSuggestion[index]}"),
              onTap: () {
                query = '${buildSuggestion[index]}';
                showResults(context);
              },
            ));
  }
}
