import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Tabone(),
  ));
}
class Tabone extends StatefulWidget{

  const Tabone({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}


class _State extends State<Tabone> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.pink
          ),
          child: Text("Tab one",style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }
}