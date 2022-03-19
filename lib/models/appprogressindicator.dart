import 'package:flutter/material.dart';

import '../constants/colorconstants.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Constantcolors.mainappbackgroundcolor1,
          ),
        ),
      ),
    );
  }
}
