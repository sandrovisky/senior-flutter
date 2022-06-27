import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:senior/home.dart';
import 'package:senior/main.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset(
                'assets/images/ico.png',
              ),
            ],
          ),
          splashIconSize: 250,
          duration: 4000,
          nextScreen: const HomePage()),
    );
  }
}
