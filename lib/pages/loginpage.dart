import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:eventscheduler/routes/routes.dart';
import 'package:eventscheduler/services/user_service.dart';
import 'package:eventscheduler/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/todoservice.dart';
import '../widgets/appbutton.dart';
import '../widgets/apptextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernamecontroller;
  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.pink,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                      text: '....Wel',
                      style: GoogleFonts.caveat(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: ' Come....',
                            style: GoogleFonts.openSans(
                              fontSize: 50,
                            ))
                      ]),
                ),
                AppTextField(
                  textfieldcontroller: usernamecontroller,
                  labelText: 'Please Enter your username',
                ),
                APPButton(
                  buttontag: 'continue',
                  color: Constantcolors.loginbuttoncolor,
                  onpressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (usernamecontroller.text.isEmpty) {
                      showsnackbar(
                          context, 'Please Enter your user name to login');
                    } else {
                      String result = await context
                          .read<UserService>()
                          .getuser(usernamecontroller.text.trim());
                      if (result != 'ok') {
                        showsnackbar(context, result);
                      } else {
                        String username =
                            context.read<UserService>().currentuser.username;
                        context.read<TodoService>().gettodos(username);
                        Navigator.of(context).pushNamed(RouteManager.todopage);
                        debugPrint(username);
                      }
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.registerpage);
                  },
                  child: Text(
                    'Register a new user',
                    style: GoogleFonts.caveat(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.red.withGreen(200),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
