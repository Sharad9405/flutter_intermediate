import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Step> _steps;
  int _current;

  @override
  void initState() {
    super.initState();
    _current = 0;
    _steps = <Step>[
      Step(title: Text('Step 1'), content: Text('Do Something 1'), isActive: true),
      Step(title: Text('Step 2'), content: Text('Do Something 2'), isActive: true),
      Step(title: Text('Step 3'), content: Text('Do Something 3'), isActive: true),
    ];
  }

  void _stepContinue(){
    print('_stepContinue Clicked');
    setState(() {
      _current++;
      if(_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel(){
    print('_stepCancel Clicked');
    setState(() {
      _current--;
      if(_current < 0) _current = 0;
    });
  }
  void _stepTap(int index){
    print('onStep Clicked');
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Stepper(
              steps: _steps,
              // type: StepperType.horizontal,
              type: StepperType.vertical,
              currentStep: _current,
              onStepCancel: _stepCancel,
              onStepContinue: _stepContinue,
              onStepTapped: _stepTap,
            )
        ),
        // child: Text(_value),
      ),
    );
  }
}
