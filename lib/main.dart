import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _MyAppState extends State<MyApp> {
  Animals _selected = Animals.Cat;
  var _value = 'Make a selection';

  var _items = List<PopupMenuEntry<Animals>>();

  @override
  void initState() {
    // super.initState();

    for (Animals animal in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(_getDisplay(animal)),
        value: animal,
      ));
    }
  }

  void _onSelected(Animals animals) {
    setState(() {
      _selected = animals;
      _value = 'You selected ${_getDisplay(animals)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup menu Button'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(_value),
              ),
            PopupMenuButton<Animals>(
                child: Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context) {
                  return _items;
                },
              )
            ],
          ),
        ),
        // child: Text(_value),
      ),
    );
  }
}
