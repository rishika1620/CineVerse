import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/bottom_nav_bar.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/json/netflix_splash.json"),

        /*Text(_text.substring(0,_animation.value), style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: Colors.red
        ),),*/
      ),
    );
  }
}
