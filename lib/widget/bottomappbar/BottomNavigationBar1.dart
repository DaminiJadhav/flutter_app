import 'package:flutter/material.dart';
import 'package:flutter_app/FlutterExample.dart';
import 'package:flutter_app/animationexamples/AnimationExample2.dart';
import 'package:flutter_app/animationexamples/AnimationLogoExample.dart';
import 'package:flutter_app/animationexamples/LottieAnimationExample.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedPage = 0;
  final _pageOptions = [
    FlutterExample(),
    LottieAnimationExample(),
    FlutterExample(),
    LottieAnimationExample(),
  ];

  Widget build(BuildContext context) {

    final _bottomNav = BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Container(height: 8.0)),
          BottomNavigationBarItem(
              icon: Container(margin: EdgeInsets.only(right: 30),child: Icon(Icons.search)), title: Container(margin: EdgeInsets.only(right: 20),)),
          BottomNavigationBarItem(
              icon: Container(margin: EdgeInsets.only(left: 30),child: Icon(Icons.notifications)), title: Container(height: 8.0)),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Container(height: 8.0)),
        ],

      ),
    );

    final _fab = FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.red,
      onPressed: () {},
    );

    return Scaffold(
      // appBar: AppBar(
      //    title: Text('Test'),
      //   backgroundColor: Colors.red,
      // ),
      body: _pageOptions[_selectedPage],
      floatingActionButton: _fab,
      bottomNavigationBar: _bottomNav,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}