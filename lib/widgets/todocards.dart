import 'package:eventscheduler/models/todo.dart';
import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colorconstants.dart';
import '../enums/todotypeenum.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final todotype type;
  const TodoCard({required this.todo, required this.type, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  title: const Text(
                    'pick any of the listed options below to select an option',
                  ),
                  actions: [
                    Column(
                      children: [
                        TodoOptionsSelector(
                          option: 'Delete',
                          onpressed: () async {
                            String result =
                                await context.read<TodoService>().deletetodo(
                                      todo,
                                      type == todotype.todos
                                          ? todotype.todos
                                          : type == todotype.doing
                                              ? todotype.doing
                                              : type == todotype.starr
                                                  ? todotype.starr
                                                  : todotype.done,
                                    );
                            Navigator.pop(context);
                            if (result == 'ok') {
                              showsnackbar(
                                  context, 'todo successfully deleted');
                            } else {
                              showsnackbar(context, result);
                            }
                          },
                        ),
                        type != todotype.doing
                            ? TodoOptionsSelector(
                                option: 'Move to doing',
                                onpressed: () async {
                                  String result2 = await context
                                      .read<TodoService>()
                                      .createtodo(todo, todotype.doing);
                                  String result1 = await context
                                      .read<TodoService>()
                                      .deletetodo(todo, todotype.todos);
                                  Navigator.pop(context);
                                  if (result1 == 'ok' && result2 == 'ok') {
                                    showsnackbar(context,
                                        'todo successfully moved to doing');
                                  } else {
                                    showsnackbar(context, result1);
                                  }
                                },
                              )
                            : Container(),
                        type != todotype.starr
                            ? TodoOptionsSelector(
                                option: 'mark as starred todo',
                                onpressed: () async {
                                  String result2 = await context
                                      .read<TodoService>()
                                      .createtodo(todo, todotype.starr);
                                  String result1 = await context
                                      .read<TodoService>()
                                      .deletetodo(todo, todotype.todos);
                                  Navigator.pop(context);
                                  if (result1 == 'ok' && result2 == 'ok') {
                                    showsnackbar(context,
                                        'todo successfully moved to starred');
                                  } else {
                                    showsnackbar(context, result1);
                                  }
                                },
                              )
                            : Container(),
                        type != todotype.done
                            ? TodoOptionsSelector(
                                option: 'mark as done',
                                onpressed: () async {
                                  String result2 = await context
                                      .read<TodoService>()
                                      .createtodo(todo, todotype.done);
                                  String result1 = await context
                                      .read<TodoService>()
                                      .deletetodo(todo, todotype.todos);
                                  Navigator.pop(context);
                                  if (result1 == 'ok' && result2 == 'ok') {
                                    showsnackbar(context,
                                        'todo successfully saved to done');
                                  } else {
                                    showsnackbar(context, result1);
                                  }
                                },
                              )
                            : Container(),
                        TodoOptionsSelector(
                          option: 'Cancel',
                          onpressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: double.infinity,
                        ),
                      ],
                    )
                  ]);
            });
      },
      child: Card(
        color: Constantcolors.mainappbackgroundcolor1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                todo.title,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                todo.created.day.toString() +
                    '-' +
                    todo.created.month.toString() +
                    '-' +
                    todo.created.year.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoOptionsSelector extends StatelessWidget {
  const TodoOptionsSelector({
    required this.option,
    required this.onpressed,
    Key? key,
  }) : super(key: key);
  final String option;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        option,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
