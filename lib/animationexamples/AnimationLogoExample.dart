import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationLogoExample extends StatefulWidget {
  @override
  _AnimationLogoExampleState createState() => _AnimationLogoExampleState();
}

class _AnimationLogoExampleState extends State<AnimationLogoExample> with SingleTickerProviderStateMixin{

  SequenceAnimation sequenceAnimationBuilder;

  AnimationController animationController;


  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: new AnimatedBuilder(
        builder: (context, child) {
          return new Center(
            child: new Container(
              color: sequenceAnimationBuilder['color'].value,
              height: 200.0,
              width: 200.0,
            ),
          );
        },
        animation: animationController,
      ),
    );
  }



}
