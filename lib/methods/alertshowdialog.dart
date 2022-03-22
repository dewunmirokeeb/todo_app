import 'package:flutter/material.dart';

Future<dynamic> alertdialogmethod(
  BuildContext context,
  TextEditingController todotitlecontroller,
) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Create a new Todo'),
        content: Builder(
          builder: (context) {
            return TextField(
              controller: todotitlecontroller,
              decoration: const InputDecoration(
                hintText: 'Please Enter todo title',
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {},
            child: const Text(
              'save',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
