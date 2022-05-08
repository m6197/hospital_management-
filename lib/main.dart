import 'package:flutter/material.dart';
import 'package:gp/login/login_screen.dart';
import 'home/Home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescrren (),
    );
  }
}

