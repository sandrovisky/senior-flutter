import 'package:flutter/material.dart';

Widget seniorAppBarHome() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/images/senior.png',
        fit: BoxFit.contain,
        height: 32,
      ),
    ],
  );
}

Widget seniorAppBarOther() {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/senior.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    ),
  );
}
