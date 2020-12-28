import 'package:flutter/material.dart';
import 'dart:async';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Welcome Third'),
              RaisedButton(
                child: Text('Back'),
                onPressed: (){
                  // Navigator.of(context).pushNamed('/Second');

                  if(Navigator.of(context).canPop()){
                    Navigator.of(context).pop();
                  }else{
                    Navigator.of(context).pushNamed('/Second');
                  }
                  // Navigator.of(context).pushNamedAndRemoveUntil('/Second', (route) => false);
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
