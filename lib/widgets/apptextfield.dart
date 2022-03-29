import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.labelText = '',
    required this.textfieldcontroller,
    this.focusedbordercolor = Constantcolors.defaultbuttoncolor,
    this.enabledbordercolor = Constantcolors.defaultbuttoncolor,
  }) : super(key: key);
  final String labelText;
  final TextEditingController textfieldcontroller;
  final Color focusedbordercolor;
  final Color enabledbordercolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 20),
        controller: textfieldcontroller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: enabledbordercolor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: focusedbordercolor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
