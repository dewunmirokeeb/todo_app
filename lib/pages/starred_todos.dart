import 'package:eventscheduler/enums/todotypeenum.dart';
import 'package:eventscheduler/widgets/messagewhenlistisempty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/todoservice.dart';
import '../widgets/todocards.dart';

class StarredTodo extends StatelessWidget {
  const StarredTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoService>(
        builder: (context, value, child) {
          return value.done.isEmpty
              ? const MessageWhenListisEmpty(
                  message:
                      'No star todo yet, Navigate to the Todoos page and long tap a todo to star a todo',
                )
              : ListView.builder(
                  itemCount: value.star.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 10, 4),
                      child: TodoCard(
                        todo: value.star[index],
                        type: todotype.starr,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
