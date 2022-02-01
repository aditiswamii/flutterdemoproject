
import 'package:flutter/material.dart';
import 'package:flutterdemoproject/tabbarview/tabone.dart';
import 'package:flutterdemoproject/tabbarview/tabtwo.dart';

void main() {
  runApp(const TabbarScreen());
}

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(160, 209, 249, 50),
            leadingWidth: 314,
            toolbarHeight: 80,


            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Tabone",style:TextStyle(color:Colors.black,fontSize: 15)),

                ),
                Tab(
                  child: Text("Tabtwo",style:TextStyle(color:Colors.black,fontSize: 15)),
                ),
              ],
            ),
          ),

          body:  TabBarView(
            children: [
              Tabone(),
              Tabtwo(),

            ],
          ),
        ),
      ),
    );
  }
}