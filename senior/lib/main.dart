import 'package:flutter/material.dart';
import 'package:senior/mainColor.dart';
import 'package:senior/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: mainColor,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      home: const MySplash(),
    );
  }
}
