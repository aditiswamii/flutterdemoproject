
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemoproject/colors/colors.dart';
import 'package:flutterdemoproject/getlocation/mapscreen.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'login_presenter.dart';
import 'login_viewmodal.dart';


void main() {

  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
class LoginPage extends StatefulWidget{

  const LoginPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}


class _State extends State<LoginPage> implements LoginViewModal{
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passwordVisible = false;
  bool value = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   late LoginScreenPresenter  _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = LoginScreenPresenter(this);
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('username');
    print(userId);
    if (userId != null) {
      setState(() {
        // isLoggedIn = true;
        // name = userId;
      });
      //Navigator.of(context).pushReplacementNamed("/home");
      return;
    }
  }
    @override
    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/login_bg.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text("LOG IN", style: TextStyle(
                        fontSize: 24, color: ColorConstants.Omnes_font))),
                Flexible(child:
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: emailController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Username or Email ID',
                      hintText: 'Username or Email ID',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),),
                Flexible(child:
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !_passwordVisible,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      // hasFloatingPlaceholder: true,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = true;
                          });
                        },
                        onPanCancel: () {
                          setState(() {
                            _passwordVisible = false;
                          });
                        },
                        child: Icon(
                            _passwordVisible ? Icons.visibility : Icons
                                .visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Password needed";
                      }
                    },
                    // onSaved: (value) {
                    // _setPassword(value);
                    // },
                  ),),),

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 3,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          fixedSize: const Size(150, 50),
                          //////// HERE
                        ),
                        onPressed: () {
                          _presenter.login(emailController.text.toString(),
                              passwordController.text.toString());
                        },
                        child: const Text(
                          "LET'S GO",
                          style: TextStyle(color: ColorConstants.Omnes_font,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text("Remember Me"),
                      Checkbox(value: this.value,
                        onChanged: (value) {
                          setState(() {
                            this.value = true;
                          });
                        },)
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text("I don't have an account", style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ColorConstants.Omnes_font),)),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: const Divider(
                    color: ColorConstants.Omnes_font,
                    height: 2,
                    indent: 10,
                    endIndent: 10,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),),
      );
    }

  @override
  void onLoginSuccess() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) =>MapScreen(),
        ),
            (Route<dynamic> route) => false);
  }
  }

