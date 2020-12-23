import 'package:flutter/material.dart';
import 'dart:async';

void main() =>
    runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var _tabController;

  List<Choice> _items = const <Choice>[
    const Choice(title: 'CAR', icon: Icons.directions_car),
    const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    const Choice(title: 'BOAT', icon: Icons.directions_boat),
    const Choice(title: 'BUS', icon: Icons.directions_bus),
    const Choice(title: 'TRAIN', icon: Icons.directions_train),
    const Choice(title: 'WALK', icon: Icons.directions_walk),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _items.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tabbar View'),
          backgroundColor: Colors.red,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                // take the theme of current context and copy with => white so it will act as accent color for this
                child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: TabPageSelector(
                    controller: _tabController,
                  ),
                ),
              )
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _items.map((Choice choice) {
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(choice.title),
                    Icon(choice.icon, size: 128.0),
                  ],
                ),
              ),
            );
          }).toList(),
        )
    );
  }
}
