import 'package:eventscheduler/enums/todotypeenum.dart';
import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/widgets/messagewhenlistisempty.dart';
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
          return value.done.isEmpty
              ? const MessageWhenListisEmpty(
                  message:
                      'No Todo added yet, hit the Plus icon above to add a todo',
                )
              : ListView.builder(
                  itemCount: value.todos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 10, 4),
                      child: TodoCard(
                        todo: value.todos[index],
                        type: todotype.todos,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
