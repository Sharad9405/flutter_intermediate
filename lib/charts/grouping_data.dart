import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;


void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class Sales{
  String year;
  int sales;

  Sales({this.year, this.sales});
}


class _MyAppState extends State<MyApp> {

  List<Sales> _laptopData;
  List<Sales> _desktopData;
  List<charts.Series<Sales, String>> _chartData;

  void _makeData(){
    _laptopData = List<Sales>();
    _desktopData = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();

    final rnd = Random();
    for(int i = 2010; i< 2018; i++){
      _laptopData.add(Sales(year: '$i', sales: rnd.nextInt(1000)));
      _desktopData.add(Sales(year: '$i', sales: rnd.nextInt(1000)));
    }

    _chartData.add(charts.Series(
        id: 'Sales',
        colorFn: (_, a) => charts.MaterialPalette.red.shadeDefault,  // charts color
        data: _laptopData,
        domainFn: (Sales sales, b) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, c) => charts.FillPatternType.forwardHatch, // fill type
        displayName: "Sales"
    ));
    _chartData.add(charts.Series(
        id: 'Sales',
        colorFn: (_, a) => charts.MaterialPalette.green.shadeDefault,  // charts color
        data: _desktopData,
        domainFn: (Sales sales, b) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, c) => charts.FillPatternType.solid, // fill type
        displayName: "Sales"
    ));

  }

  @override
  void initState() {
    super.initState();
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grouping Data in chart'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Sales Data'),

              Expanded(
                child: charts.BarChart(
                  _chartData,
                  // vertical: false, // to show horizontally
                ),
              ),
            ],
          ),
        ),
        // child: Text(_value),
      ),
    );
  }
}
