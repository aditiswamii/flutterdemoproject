import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home: NotificationPage(),
  ));
}
class NotificationPage extends StatefulWidget{

  const NotificationPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NotificationPage> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });

    messaging.subscribeToTopic("messaging");//To send messages to multiple users, you can use topics
    messaging.unsubscribeFromTopic("messaging");//unsubscribefromtopic

    // //if app in background
    // Future<void> _messageHandler(RemoteMessage message) async {
    //   print('background message ${message.notification!.body}');
    // }
    // void main() async {
    //   WidgetsFlutterBinding.ensureInitialized();
    //   await Firebase.initializeApp();
    //   FirebaseMessaging.onBackgroundMessage(_messageHandler);
    //   runApp(MessagingTutorial());
    // }

 // //if app in foreground
    // FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    //   print("message recieved");
    //   print(event.notification!.body);
    //   print(event.data.values);

    //if you want to show dialog of message
    //FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    //       print("message recieved");
    //       print(event.notification!.body);
    //       showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return AlertDialog(
    //               title: Text("Notification"),
    //               content: Text(event.notification!.body!),
    //               actions: [
    //                 TextButton(
    //                   child: Text("Ok"),
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                 )
    //               ],
    //             );
    //           });
    //     });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}