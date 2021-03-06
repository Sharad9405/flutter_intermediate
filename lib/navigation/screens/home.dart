import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Welcome Home'),
              RaisedButton(
                child: Text('Next'),
                onPressed: (){
                  // Navigator.of(context).pushNamed('/Second');
                  Navigator.of(context).pushNamedAndRemoveUntil('/Second', (route) => false,);  // route==> true/false to show the back button
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
