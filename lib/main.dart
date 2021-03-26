import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animationexamples/LottieAnimationExample.dart';
import 'package:flutter_app/animationexamples/LottieAnimationSplashSCreen.dart';
import 'package:flutter_app/firebase_database/FirebaseOTPExample.dart';
import 'package:flutter_app/firebase_database/MyFirebaseDemo.dart';
import 'package:flutter_app/razorpay_example/RazorpayExample.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FirebaseOTPExample(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// sudo apt-get remove <application_name>
// rules_version = '2';
// service cloud.firestore {
// match /databases/{database}/documents {
// match /{document=**} {
// allow read, write: if
// request.time < timestamp.date(2021, 4, 17);
// }
// }
// }