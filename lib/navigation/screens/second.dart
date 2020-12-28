import 'package:flutter/material.dart';
import 'dart:async';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Welcome Second'),
              RaisedButton(
                child: Text('Next'),
                onPressed: (){
                  Navigator.of(context).pushNamed('/Third');
                },
              ),
              RaisedButton(
                child: Text('Back'),
                onPressed: (){
                  // Navigator.of(context).pushNamed('/Home');
                  Navigator.of(context).pop();
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
