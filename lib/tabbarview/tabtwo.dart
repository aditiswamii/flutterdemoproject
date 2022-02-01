import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Tabtwo(),
  ));
}
class Tabtwo extends StatefulWidget{

  const Tabtwo({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}


class _State extends State<Tabtwo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Text("Tab one",style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}