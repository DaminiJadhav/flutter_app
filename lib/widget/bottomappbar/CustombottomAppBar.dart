import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/FlutterExample.dart';
import 'package:flutter_app/animationexamples/LottieAnimationExample.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {

  int _selectedPage = 0;
  final _pageOptions = [
    FlutterExample(),
    LottieAnimationExample(),
    FlutterExample(),
    FlutterExample(),
    FlutterExample(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _pageOptions[_selectedPage],
      appBar: AppBar(
        title: Text("bottom navigator"),
      ),
      bottomNavigationBar:Container(
        // margin: EdgeInsets.only(left: 6,right: 6,bottom: 10),
        // padding: EdgeInsets.only(bottom: 6,left: 6,right: 6),

        // decoration: BoxDecoration(
          // color: Colors.blue,
            // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft:  Radius.circular(15))

          // borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomRight: Radius.circular(15),bottomLeft:  Radius.circular(15))
        // ),
        child: ConvexAppBar(
          height: 50,
            // cornerRadius:15 ,
            // disableDefaultTabController: false,
            style: TabStyle.fixedCircle,
            backgroundColor: Colors.white,
            color: Colors.grey,
            activeColor: Colors.blue,
            elevation: 20,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Discovery'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(icon: Icons.people, title: 'Profile'),
            ],
            initialActiveIndex: 3,
            //optional, default as 0

            onTap: (int i) {
              setState(() {
                _selectedPage = i;
              });
                // if(i==0){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               FlutterExample()));
                // }else{
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               LottieAnimationExample()));
                // }
            },
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: Stack(
      //     children: [
      //
      //       Container(
      //         height: 40,
      //         margin: EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: Colors.red,
      //           borderRadius: BorderRadius.circular(30)
      //         ),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 child: Icon(Icons.home),
      //               ),
      //             ),
      //             Expanded(
      //               child:
      //               Container(
      //                 child: Icon(Icons.home),
      //               ),
      //             ),
      //             Expanded(
      //               child:
      //               Container(
      //                 child: Icon(Icons.home),
      //               ),
      //             ),
      //             // Expanded(
      //             //   child: Container(
      //             //     decoration: BoxDecoration(
      //             //       color: Colors.blue,
      //             //       borderRadius: BorderRadius.all(Radius.circular(30))
      //             //     ),
      //             //     child: Icon(Icons.add),
      //             //   ),
      //             // ),
      //             Expanded(
      //               child: Container(
      //                 child: Icon(Icons.home),
      //               ),
      //             ),
      //             Expanded(
      //               child: Container(
      //                 child: Icon(Icons.home),
      //               ),
      //             )
      //           ],
      //         ),
      //
      //       ),
      //
      //       Container(
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.all(Radius.circular(30))
      //         ),
      //         child: Icon(Icons.add),
      //       ),
      //     ],
      //   ),
      //
      // ),
    );
  }
}
