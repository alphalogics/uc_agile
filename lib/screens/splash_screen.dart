import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: ColorConst.splash_bg,
          image: DecorationImage(
            image: AssetImage("assets/splash_img.png"),
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 250),
          child: AnimatedSplashScreen(
            nextScreen: WelcomeScreen(),
            duration: 3 * Duration.millisecondsPerSecond,
            centered: true,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 10),
            splash: Image.asset("assets/uc_logo.png"),
          ),
        ),
      ),
    );
  }
}
