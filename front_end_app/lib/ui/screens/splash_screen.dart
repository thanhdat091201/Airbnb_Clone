import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:front_end/infrastructure/utills/route_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
          () => Navigator.of(context).pushReplacementNamed(RouteConstants.homeScreen),
    );

    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://assets8.lottiefiles.com/datafiles/YVp57opyTyvbbZA/data.json',
          width: 200,
          height: 200,
          repeat: false,
          reverse: false,
          animate: true,
        ),
      ),
    );
  }
}

