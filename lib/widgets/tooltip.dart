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

  String _value = 'Hello World';

  void _onPressed() => setState(() => _value = DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),

              IconButton(
                icon: Icon(Icons.timer),
                onPressed: _onPressed,
                tooltip: 'Set Timer',
              ),
            ],
          ),
        ),
        // child: Text(_value),
      ),
    );
  }
}
