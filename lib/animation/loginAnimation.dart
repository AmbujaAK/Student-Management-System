import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import '../auth/loginApp.dart';

class LoginAnimation extends StatefulWidget {
  final LoginApp loginApp;
  LoginAnimation({Key key, this.loginApp});

  @override
  _LoginAnimationState createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> 
    with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;
  
  @override
  void initState() {
    super.initState();
    animationController =AnimationController(duration: Duration(seconds: 3,), vsync: this);

    animation =Tween(begin: -5.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      )
    );

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: widget.loginApp
        );
      },
    );
  }
}