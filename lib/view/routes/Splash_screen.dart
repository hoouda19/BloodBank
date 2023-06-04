import 'dart:async';

import 'package:bloodbank/view/routes/onboard_page_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(OnboardScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/splashscreen.png',
            width: 400,
            height: 400,
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          const Text('Loding...')
        ],
      )),
    );
  }
}
