import 'package:flutter/material.dart';

class AnimationExample1 extends StatefulWidget {
  @override
  _AnimationExample1State createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1> with TickerProviderStateMixin{

  Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  AnimationController _containerAnimationController;

  @override
  void initState() {

    _containerAnimationController=AnimationController(vsync: this, duration: Duration(milliseconds: 5000));

    _containerRadiusAnimation=BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(CurvedAnimation(
        parent: _containerAnimationController,
        curve:  Curves.ease));

    _containerSizeAnimation=Tween(begin: 0.0,end: 2.0).animate(
      CurvedAnimation(
          parent: _containerAnimationController,
          curve: Curves.ease
      )
    );

    _containerColorAnimation=ColorTween(begin: Colors.purple[300], end: Colors.purple)
        .animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));



    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _containerAnimationController,
          builder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 20,top: 40),
              transform: Matrix4.translationValues(
                  _containerSizeAnimation.value*width-200.0,0.0,0.0
              ),
              width: _containerSizeAnimation.value*width,
              height: _containerSizeAnimation.value*height,
              decoration: BoxDecoration(
                borderRadius: _containerRadiusAnimation.value,
                color: _containerColorAnimation.value
              ),
              child: Text("DAMINI "),
            );
          },
        ),
      ),
    );
  }
}
