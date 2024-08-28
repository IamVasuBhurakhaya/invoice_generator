import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoice_generator/routes/appRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
      timer.cancel();
    });
    return Scaffold();
  }
}
