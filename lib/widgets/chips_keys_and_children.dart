import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter = 0;
  var _list = List<Widget>();



  @override
  void initState() {
    // super.initState();
    for(int i=0; i<5;i++){
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked(){
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i){
    Key key = Key('item_$i');
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('$i Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _remove(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('$i'),
        ),
      ),
    );
    counter++;
    return child;
  }
  void _remove(Key key){
    for(int i = 0; i<_list.length; i++){
      var child = _list.elementAt(i);
      if(child.key == key){
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip, keys and Children'),
        backgroundColor: Colors.red,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: _onClicked,
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
              children: _list
          ),
        ),
        // child: Text(_value),
      ),
    );
  }
}
