import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';

import 'package:redux/redux.dart';

// Actions
enum Actions { Increment, Decrement }

// Reducer => reducer return a new state
int reducer(int state, dynamic action) {
  if (action == Actions.Increment) state++;
  if (action == Actions.Decrement) state--;
  return state;
}

void main() {
  final store = Store(reducer, initialState: 0);
  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.store}): super(key: key);
  final Store<int> store;

  @override
  Widget build(BuildContext context)  {
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Redux',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter redux'),
            ),
            body: Container(
              child: Column(
                children: [
                  //    Make a connector to connect redux store
                  StoreConnector<int, String>(
                      builder: (context, count) {
                        return Text(count, style: TextStyle(
                            fontSize: 24.0
                        ),);
                      },
                      converter: (store) => store.state.toString()
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () =>  store.dispatch(Actions.Decrement),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => store.dispatch(Actions.Increment),
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        ));
  }


}



