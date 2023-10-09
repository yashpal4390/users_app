import 'dart:async';

import 'package:flutter/material.dart';

import 'constant.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,usersdetail);
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(child: Image.asset("images/logo.jpg", width: 200, height: 200)),
    );
  }
}
