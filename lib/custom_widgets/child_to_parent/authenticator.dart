import 'package:flutter/material.dart';
import 'dart:async';


class Authenticator extends StatefulWidget {

  Authenticator({Key key, this.onAuthenticated});

  final ValueChanged<bool>  onAuthenticated;


  @override
  _AuthenticatedState createState() => _AuthenticatedState(onAuthenticated: onAuthenticated);
}

class _AuthenticatedState extends State<Authenticator> {

  _AuthenticatedState({Key key, this.onAuthenticated});


  TextEditingController _user;
  TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;


  void _onPressed(){
    if(_user.text != 'user' || _pass.text != '1234'){
      onAuthenticated(false);
      print('Authenticator => onAuthenticated : false');
    }else{
      onAuthenticated(true);
      print('Authenticator => onAuthenticated : true');
    }
  }

  @override
  void initState() {
    super.initState();
    _user = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _user,
              decoration: InputDecoration(
                labelText: 'Username'
              ),
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(
                  labelText: 'Password',
              ),
              obscureText: true ,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _onPressed,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
