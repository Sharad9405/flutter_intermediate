import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_intermediate/state_management/global_state_and_passing_param/global_state.dart';

class Second extends StatefulWidget {
  // passing variable
  Second(this.name);
  String name;

  @override
  _SecondState createState() => _SecondState(name);
}

class _SecondState extends State<Second> {
  _SecondState(this.name);
  String name;
  
  GlobalState _store = GlobalState.instance;
  
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
              Text('Global State Hello ${_store.get('name')}'),
              Text('Passing value => Hello $name'),
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
