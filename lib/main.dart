import 'package:flutter/material.dart';
import 'package:invoice_generator/routes/appRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xffb79ced), splashColor: Color(0xff7161ef)),
        scaffoldBackgroundColor: Color(0xffdec0f1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffdec0f1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
