import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animationexamples/AnimationExample2.dart';
import 'package:flutter_app/animationexamples/AnimationLogoExample.dart';
import 'package:flutter_app/animationexamples/LottieAnimationExample.dart';
import 'package:flutter_app/animationexamples/LottieAnimationSplashSCreen.dart';
import 'package:flutter_app/animationexamples/animation_example1.dart';
import 'package:flutter_app/firebase_database/FirebaseOTPExample.dart';
import 'package:flutter_app/firebase_database/MyFirebaseDemo.dart';
import 'package:flutter_app/fontexamples/FontExample.dart';
import 'package:flutter_app/getimage/GetImageScreen.dart';
import 'package:flutter_app/pdf/pdfScreen.dart';
import 'package:flutter_app/razorpay_example/RazorpayExample.dart';
import 'package:flutter_app/widget/bottomappbar/BottomNavigationBar1.dart';
import 'package:flutter_app/widget/bottomappbar/BottomSheetUsingPaint.dart';
import 'package:flutter_app/widget/bottomappbar/CustombottomAppBar.dart';
import 'package:flutter_app/widget/bottomappbar/customconvexbottomsheet.dart';
import 'package:flutter_app/widget/date/dataselectpickerscreen.dart';
import 'package:flutter_app/widget/date/horizotallist/DateHorizotalListScreen.dart';
import 'package:flutter_app/widget/listview/ListPage.dart';
import 'package:flutter_app/widget/listview/scrollablelistview.dart';
import 'package:flutter_app/widget/nAVIGATIONbAReXAMPLE.dart';
import 'package:flutter_app/widget/tabs/tabexample.dart';

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