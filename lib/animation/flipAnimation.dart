import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  final Container image;
  FlipAnimation({Key key, this.image});
  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> with SingleTickerProviderStateMixin {
  bool isFlipped =false;
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation =TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -pi/2,
        ),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: pi/2,
          end: 0.0,
        ),
        weight: 0.5,
      ),
    ]).animate(_animationController);
    super.initState();
  }

  _doAnimation() {
    if(!mounted) return;
    if(isFlipped){
      _animationController.reverse();
      isFlipped =false;
    }else{
      _animationController.forward();
      isFlipped =true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0001)
          ..rotateY(_animation.value),

          child: GestureDetector(
            onTap: _doAnimation,
            child: IndexedStack(
              children: <Widget>[
                FrontCard(image: widget.image,),
                BackCard(
                  text: "Ambuja",
                  textColor: Colors.white,
                  backgroundcolor: Colors.black12,
                ),
              ],
              alignment: Alignment.center,
              index: _animationController.value < 0.5 ? 0 : 1,
            ),
          ),
        ),
      ),
    );
  }
}

class FrontCard extends StatelessWidget {
  final Container image;
  FrontCard({Key key, this.image});
  @override
  Widget build(BuildContext context) {
    return image;
  }
}

class BackCard extends StatelessWidget {
  final backgroundcolor;
  final text;
  final textColor;
  
  BackCard({
    Key key,
    this.backgroundcolor,
    this.text,
    this.textColor
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundcolor,
      child: Container(
        height: 150,
        width: 100,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}