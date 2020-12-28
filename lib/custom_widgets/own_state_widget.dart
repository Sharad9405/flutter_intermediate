import 'package:flutter/material.dart';

// Each individual widget has its own state
class OwnWidgetState extends StatefulWidget {
  @override
  _OwnWidgetStateState createState() => _OwnWidgetStateState();
}

class _OwnWidgetStateState extends State<OwnWidgetState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Text('Hello World'),
    );
  }
}

