import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyItem{
  bool isExpanded;
  String header;
  Widget body;

  MyItem(this.isExpanded, this.header,this.body);

}

class _MyAppState extends State<MyApp> {

  List<MyItem> _items = List<MyItem>();


  @override
  void initState() {
    super.initState();

    for(int i =0; i< 10; i++){
      _items.add(MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(0.0),
            child: Text('Hello World'),
          )
      )
      );
    }
  }

  ExpansionPanel _createItem(MyItem item){
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded){
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Text('Header ${item.header}',),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded,
        canTapOnHeader: false
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded){
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              // we have a list of _items, we gonna map that to _createItem and convert back to list and inheaded as the children
              children: _items.map(_createItem).toList(),    // mapping takes a list and map each item to function
            )
          ],
        ),
        // child: Text(_value),
      ),
    );
  }
}
