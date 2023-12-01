import 'dart:async';

import 'package:e_commerce/ui/home/home_screen/widget/home_screen_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = ' Splash Screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash_Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
