import 'dart:math';

import 'package:flutter/material.dart';

class AnimationExample2 extends StatefulWidget {
  @override
  _AnimationExample2State createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2> with SingleTickerProviderStateMixin {

  Animation _arrowAnimation, _heartAnimation;
  AnimationController _arrowAnimationController, _heartAnimationController;


  @override
  void initState() {
    // _arrowAnimationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // _arrowAnimation =
    //     Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    _heartAnimationController=AnimationController(vsync: this,duration: Duration(milliseconds: 1200));


    _heartAnimation=Tween(begin: 150.0,end: 170.0).animate(
      CurvedAnimation(  curve: Curves.bounceOut, parent: _heartAnimationController)
    );

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
        _heartAnimationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    // _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // firstChild(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
        ],
      ),
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _heartAnimationController,
              builder: (context,child){
                return Center(
                  child: Container(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                );
              },
            )
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlineButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController.forward();
              },
              splashColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }

  Widget firstChild() {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context,child){
            return Transform.rotate(
                angle: _arrowAnimation.value,
                child: Icon(
                  Icons.expand_more,
                  size: 50.0,
                  color: Colors.black,
                ),
            );
          },
        ),
        OutlineButton(
          color: Colors.white,
          textColor: Colors.black,
          padding: const EdgeInsets.all(12.0),
          child: Text('Start Icon Animation'),
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          splashColor: Colors.red,
        )
      ],
    );
  }

}
