import 'package:flutter/material.dart';
import 'myHome.dart';

class SplashAnimation extends StatefulWidget {
  @override
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if (status ==AnimationStatus.dismissed){
        //animationController.forward();
        
        new Future.delayed(
          const Duration(microseconds: 1),
          () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyHomePage()
            ),
          )
        );
        
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedLogo(
        animation: animation,
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Tween<double> _sizeAnim = Tween<double>(begin: 6.0, end: 500.0);

  AnimatedLogo({Key key, Animation animation}):super(
    key:key,listenable:animation
  );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: _sizeAnim.evaluate(animation),
      child: FlutterLogo(),
    );
  }
}