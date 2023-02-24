import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/screens/HomeScreen.dart';


class Splach extends StatelessWidget {
  static const String screenRoute = 'Splach';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.deepPurple,
        duration:4000 ,
        splashIconSize: 150,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration:Duration(seconds: 1) ,
        splash: Container(
            child:Image.asset('images/qr.png')
        ),
        nextScreen: Mainscreen());
    }
}