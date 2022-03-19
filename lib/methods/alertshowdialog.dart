import 'package:flutter/material.dart';

Future<dynamic> alertdialogmethod(
  BuildContext context,
  TextEditingController todotitlecontroller,
  TextEditingController moretodoinfocontroller,
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
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: todotitlecontroller,
                decoration: const InputDecoration(
                  hintText: 'Please Enter todo title',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    child: TextField(
                      textAlign: TextAlign.justify,
                      maxLines: null,
                      controller: moretodoinfocontroller,
                      decoration: const InputDecoration(
                        hintText: 'add more description',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
            child: const Text('save to',
                style: TextStyle(
                  color: Colors.black,
                )),
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
