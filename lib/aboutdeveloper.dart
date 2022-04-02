import 'package:eventscheduler/widgets/messagewhenlistisempty.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessageWhenListisEmpty(
          message:
              'Hy every one, i am Adedokun Rokeeb Adewunmi a Flutter Developer.... more information about me can be gotten on my portfolio website which i am Stil doing,  thank you'),
    );
  }
}
