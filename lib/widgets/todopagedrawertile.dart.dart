import 'package:flutter/material.dart';

import '../constants/colorconstants.dart';

class TodoPageDrawerTile extends StatelessWidget {
  const TodoPageDrawerTile({
    required this.icon,
    required this.tiletitle,
    required this.onTapp,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String tiletitle;
  final Function() onTapp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        onTap: onTapp,
        leading: Icon(
          icon,
          size: 35,
          color: Constantcolors.mainappbackgroundcolor1,
        ),
        title: Text(
          tiletitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
