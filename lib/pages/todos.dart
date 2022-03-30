import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/widgets/todocards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosTodo extends StatelessWidget {
  const TodosTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoService>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 10, 4),
                child: TodoCard(
                  todo: value.todos[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
