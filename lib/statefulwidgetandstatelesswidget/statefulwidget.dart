import 'package:flutter/material.dart';

void main() => runApp(MyStateful());

class MyStateful extends StatefulWidget //we can change the value of text,color,checkbox
                                        // in runtime with the help of state
{
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyStateful> {
  Color _containerColor = Colors.yellow;

  void changeColor() {
    setState(() {
      if (_containerColor == Colors.yellow) {
        _containerColor = Colors.red;
        return;
      }
      _containerColor = Colors.yellow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("A Simple App Stateful Widget")),
          body: Container(decoration: BoxDecoration(color: _containerColor)),
          floatingActionButton: FloatingActionButton(
            onPressed: changeColor,
            child: Icon(Icons.add),
            tooltip: "Book Here",
          ),
        ));
  }
}