import 'package:flutter/material.dart';
import '../constants/colorconstants.dart';

class APPButton extends StatelessWidget {
  final String buttontag;
  final Color color;
  final Function() onpressed;
  const APPButton({
    required this.buttontag,
    this.color = Constantcolors.defaultbuttoncolor,
    required this.onpressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      onPressed: onpressed,
      child: Text(buttontag),
    );
  }
}
