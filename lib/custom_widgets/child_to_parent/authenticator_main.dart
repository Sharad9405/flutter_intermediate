import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_intermediate/custom_widgets/child_to_parent/authenticator.dart';

// get details back from child widget
void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isAuthenticated;

  void _onAuthenticated(bool value){
    setState(() {
      print('onAuthenticated : $value');
      _isAuthenticated = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _isAuthenticated = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child To Parent'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Authenticator(onAuthenticated: _onAuthenticated,),
              Text('Authenticated: $_isAuthenticated'),
            ],
          ),
        ),
        // child: Text(_value),
      ),
    );
  }
}
