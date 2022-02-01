import 'package:flutter/material.dart';

void main() => runApp(MyStateless());

class MyStateless extends StatelessWidget { //cannot change values in runtime
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("A Simple App Stateless Widget")),
          body: Container(
            decoration: BoxDecoration(color: Colors.yellow),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Book Here", onPressed: () {  },
          ),
        ));
  }
}