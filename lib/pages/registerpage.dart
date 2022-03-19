import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbutton.dart';
import '../widgets/apptextfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController usernamecontroller;
  late TextEditingController namecontroller;
  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    namecontroller = TextEditingController();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Constantcolors.mainappbackgroundcolor1,
                  Constantcolors.mainappbackgroundcolor2
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
                          text: '....Register',
                          style: GoogleFonts.caveat(
                            fontSize: 70,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                                text: ' User....',
                                style: GoogleFonts.caveat(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ))
                          ]),
                    ),
                    Focus(
                      onFocusChange: (value) async {},
                      child: AppTextField(
                        usernamecontroller: usernamecontroller,
                        labelText: 'Please Enter your username',
                      ),
                    ),
                    const Text(
                      'User name exist please choose another',
                      style: TextStyle(
                        color: Color.fromARGB(255, 70, 7, 3),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    AppTextField(
                      usernamecontroller: namecontroller,
                      labelText: 'Please Enter your name',
                    ),
                    APPButton(
                      buttontag: 'Register',
                      color: Constantcolors.loginbuttoncolor,
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                  color: Constantcolors.loginbuttoncolor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //const AppProgressIndicator()
        ],
      ),
    );
  }
}