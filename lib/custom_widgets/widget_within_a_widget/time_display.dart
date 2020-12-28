import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {

  TimeDisplay({Key key, Color this.color, this.duration, this.onClear}) : super(key: key);


  Duration duration = Duration();
  Color color = Colors.green;
   ValueChanged<Duration> onClear;


  void _onClicked(){
    onClear(duration);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            duration.toString(), style: TextStyle(fontSize: 32.0, color: color),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: _onClicked,
          ),
        )
      ],
    );
  }
}
