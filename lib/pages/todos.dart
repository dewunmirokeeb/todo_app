import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/todo.dart';

class TodosTodo extends StatelessWidget {
  const TodosTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: TodoCard(
              todo: Todo(
                username: 'Rokeeb',
                title: 'my todo title',
                created: DateTime.now(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => 3,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.domain,
              label: 'move to doing',
            ),
            SlidableAction(
              onPressed: (context) => 3,
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.white,
              icon: Icons.star,
              label: 'Star',
            ),
            SlidableAction(
              onPressed: (context) => 3,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
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
        ));
  }
}
