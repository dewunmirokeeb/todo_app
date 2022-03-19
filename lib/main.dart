import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:eventscheduler/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constantcolors.scaffoldbackgroundcolor,
        brightness: Brightness.light,
      ),
      initialRoute: RouteManager.loginpage,
      onGenerateRoute: RouteManager.generateroute,
    );
  }
}
