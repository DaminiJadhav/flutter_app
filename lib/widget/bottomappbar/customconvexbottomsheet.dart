import 'package:flutter/material.dart';
import 'package:flutter_app/animationexamples/LottieAnimationSplashSCreen.dart';
import 'package:flutter_app/fontexamples/FontExample.dart';
import 'package:flutter_app/razorpay_example/RazorpayExample.dart';
import 'package:flutter_app/widget/bottomappbar/BottomNavigationBar1.dart';

class customconvexbottomsheet extends StatefulWidget {
  @override
  _customconvexbottomsheetState createState() => _customconvexbottomsheetState();
}

class _customconvexbottomsheetState extends State<customconvexbottomsheet> {
  Function (int) onchange;
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15,left: 6,right: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey,
        ),
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _customNavigation(Icons.home,0),
            _customNavigation(Icons.book,1),
            _customNavigation(Icons.fifteen_mp,2),
            _customNavigation(Icons.ac_unit,3),
            _customNavigation(Icons.logout,4),

          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            if(_selectedIndex==0) FontExample(),
            if(_selectedIndex==1) FontExample(),
            if(_selectedIndex==2) Dashboard(),
            if(_selectedIndex==3) FontExample(),
            if(_selectedIndex==4) FontExample(),


          ],
        ),
        // child:_selectedIndex==0 ? FontExample() : _selectedIndex==1 ? LottieAnimationSplashScreen() :Dashboard() ,
        // child: Text("Tab ${_selectedIndex}"),
      ),
    );
  }

  _customNavigation(IconData icon,int index){
    return  GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex=index;
        });
      },
      child:index==2 ?
      Container(
        height: 70,
        width: MediaQuery.of(context).size.width/5,
        padding: EdgeInsets.only(left: 2,right: 2),

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red
        ),
        // color: index==_selectedIndex ? Colors.blue : Colors.white,
        child:Row(
          children: [
            Text("B",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Image.asset("assets/book.png",width: 30,height: 35,),
            ),
            Text("0",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
            Text("K",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

          ],
        )
      ) :
      Container(
        height: 50,
        // width: MediaQuery.of(context).size.width/5,
        // color: index==_selectedIndex ? Colors.blue : Colors.white,
        child: Icon(icon,color: index==_selectedIndex ? Colors.blue : Colors.white,),
      )
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

