import 'package:flutter/material.dart';
import 'second.dart';
import 'global_state.dart';

void main() => runApp(GlobalStateMain());

class GlobalStateMain extends StatefulWidget {
  @override
  _GlobalStateMainState createState() => _GlobalStateMainState();
}

class _GlobalStateMainState extends State<GlobalStateMain> {

  TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed(){
    _store.set('name', _name.text);
    // Global state
    // Navigator.of(context).pushNamed('/Second');
    
    // passing variable
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) => Second(_name.text)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Global State'),
          backgroundColor: Colors.red,
        ),

        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[

                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: 'Enter your name'
                  ),
                ),

                RaisedButton(
                  child: Text('Next'),
                  onPressed: _onPressed,
                ),
              ],
            ),
          ),
          // child: Text(_value),
        ),
      ),
    );
  }
}
