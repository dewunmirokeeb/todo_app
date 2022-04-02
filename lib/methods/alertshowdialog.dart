import 'package:eventscheduler/models/todo.dart';
import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/services/user_service.dart';
import 'package:eventscheduler/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums/todotypeenum.dart';

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
            onPressed: () async {
              if (todotitlecontroller.text.isEmpty) {
                showsnackbar(context, 'Enter a todo then save');
              } else {
                String username =
                    context.read<UserService>().currentuser.username;
                Todo todo = Todo(
                  username: username,
                  title: todotitlecontroller.text,
                  created: DateTime.now(),
                );
                if (context.read<TodoService>().todos.contains(todo)) {
                  showsnackbar(
                      context, 'Duplicate value please enter a new todo');
                } else {
                  String result = await context
                      .read<TodoService>()
                      .createtodo(todo, todotype.todos);
                  if (result == 'ok') {
                    showsnackbar(context, 'New todo successfully created ');
                    todotitlecontroller.text = '';
                  } else {
                    showsnackbar(context, result);
                  }
                  Navigator.pop(context);
                }
              }
            },
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
