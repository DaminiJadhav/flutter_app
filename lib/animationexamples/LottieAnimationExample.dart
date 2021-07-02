

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bottomappbar/CustombottomAppBar.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationExample extends StatefulWidget {
  @override
  _LottieAnimationExampleState createState() => _LottieAnimationExampleState();
}

class _LottieAnimationExampleState extends State<LottieAnimationExample> with TickerProviderStateMixin {

   AnimationController animationController;

   // _LottieAnimationExampleState(){
   //   animationController = AnimationController(vsync:this);
   //
   // }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync:this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animation"),
      ),
      body:_lottieAnimationImages(),
    );
  }




  Widget _lottieAnimationImages(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/2021_animation.json',
            repeat: true,
            reverse: true,
            animate: true,
          ),

          RaisedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CustomBottomAppBar()));
          },
          child: Text("data"),)

          // Lottie.network(
          //   'https://assets8.lottiefiles.com/packages/lf20_HX0isy.json',
          //   repeat: true,
          //   reverse: true,
          //   animate: true,
          // ),

          //           'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'

        ],
      ),
    );
  }
}
