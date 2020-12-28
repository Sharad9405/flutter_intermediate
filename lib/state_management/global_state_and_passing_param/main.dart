import 'package:flutter/material.dart';
import 'global_state_main.dart';
import 'second.dart';

void main(){
  runApp(MyAppPushNamed());
}

class MyAppPushNamed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
      //  All available pages
        '/Second': (BuildContext context) => Second('null'),
      },
      home: GlobalStateMain(),
    );
  }
}
