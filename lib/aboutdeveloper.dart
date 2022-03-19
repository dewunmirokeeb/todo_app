import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('I write about my self here and add my pictures'),
      color: Colors.orange[100],
    );
  }
}
