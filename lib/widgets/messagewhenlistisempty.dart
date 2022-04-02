import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageWhenListisEmpty extends StatelessWidget {
  const MessageWhenListisEmpty({
    required this.message,
    Key? key,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(border: Border.all(width: 3, color: Colors.red)),
        child: Text(
          message,
          style: GoogleFonts.caveat(
            color: Colors.red.withGreen(10000),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
