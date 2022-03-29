import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:eventscheduler/routes/routes.dart';
import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserService(),
        ),
        ChangeNotifierProvider(
          create: (create) => TodoService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Constantcolors.scaffoldbackgroundcolor,
          brightness: Brightness.light,
        ),
        initialRoute: RouteManager.loginpage,
        onGenerateRoute: RouteManager.generateroute,
      ),
    );
  }
}
