import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterdemoproject/getlocation/mapscreen.dart';
import 'package:flutterdemoproject/searchplacemap/searchplacesonmap.dart';
import 'package:flutterdemoproject/tabbarview/tabbar.dart';
import 'maplocation/maplocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  TabbarScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Timer(
    // const Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (BuildContext context) => MyLocationMap()))
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'Flutter Demo project',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
