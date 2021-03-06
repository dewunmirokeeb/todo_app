import 'package:eventscheduler/aboutdeveloper.dart';
import 'package:eventscheduler/pages/donetodos.dart';
import 'package:eventscheduler/pages/draftstodo.dart';
import 'package:eventscheduler/pages/settingspage.dart';
import 'package:eventscheduler/pages/todowithalerm_todos.dart';
import 'package:flutter/material.dart';
import '../pages/loginpage.dart';
import '../pages/registerpage.dart';
import '../pages/todopage.dart';

class RouteManager {
  static const String loginpage = '/';
  static const String registerpage = '/RegisterPage';
  static const String todopage = '/RegisterPage/TodoPage';
  static const String drafttodopage = '/RegisterPage/TodoPage/drafttodo';
  static const String donetodopage = '/RegisterPage/TodoPage/donettodo';
  static const String trashtodopage = '/RegisterPage/TodoPage/trashtodo';
  static const String aboutdeveloperpage =
      '/RegisterPage/TodoPage/aboutdeveloper';
  static const String settingspage = '/RegisterPage/TodoPage/settingspage';

  static Route<dynamic> generateroute(RouteSettings settings) {
    switch (settings.name) {
      case loginpage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case registerpage:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case todopage:
        return MaterialPageRoute(
          builder: (context) => const TodoPage(),
        );
      case drafttodopage:
        return MaterialPageRoute(
          builder: (context) => const DraftTodos(),
        );
      case donetodopage:
        return MaterialPageRoute(
          builder: (context) => const DoneTodo(),
        );
      case trashtodopage:
        return MaterialPageRoute(
          builder: (context) => const TrashTodo(),
        );
      case aboutdeveloperpage:
        return MaterialPageRoute(
          builder: (context) => const AboutMe(),
        );
      case settingspage:
        return MaterialPageRoute(
          builder: (context) => const Settings(),
        );
      default:
        throw const FormatException(
            'Route not found! check Route folder again');
    }
  }
}
