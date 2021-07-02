import 'package:flutter/material.dart';

class BottomSheetUsingPaint extends StatefulWidget {
  @override
  _BottomSheetUsingPaintState createState() => _BottomSheetUsingPaintState();
}

class _BottomSheetUsingPaintState extends State<BottomSheetUsingPaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // floatingActionButton: FloatingActionButton(
      //   child: Row(
      //     children: [
      //       Text("B",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
      //       Padding(
      //         padding: const EdgeInsets.only(top:10.0),
      //         child: Image.asset("assets/book.png",width: 20,height: 35,),
      //       ),
      //       Text("0",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
      //       Text("K",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
      //
      //     ],
      //   )
      // ),
      body: MyCustomBottomSheet(),
    );
  }
}



class MyCustomBottomSheet extends StatefulWidget {
  @override
  _MyCustomBottomSheetState createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet> {
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 60,
                // color: Colors.red,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width,80),
                      painter: MyCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child:  FloatingActionButton(
                        child: Row(
                          children: [
                            Text("B",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Image.asset("assets/book.png",width: 21,height: 35,),
                            ),
                            Text("0",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                            Text("K",style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),

                          ],
                        )
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.add_to_home_screen),
                          Icon(Icons.add_to_home_screen),
                          Container(
                            width: size.width*0.20,
                          ),
                          Icon(Icons.add_to_home_screen),
                          Icon(Icons.add_to_home_screen),

                        ],
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint=Paint()..color=Colors.white..style=PaintingStyle.fill;
    Path path=Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),radius: Radius.circular(10.0),clockwise: false);

    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 30, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

