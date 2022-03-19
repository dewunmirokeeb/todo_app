import 'package:flutter/material.dart';

class FutureTodo extends StatelessWidget {
  const FutureTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const Text('hello');
        },
      ),
    );
  }
}
