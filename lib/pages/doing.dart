import 'package:eventscheduler/enums/todotypeenum.dart';
import 'package:eventscheduler/widgets/messagewhenlistisempty.dart';
import 'package:eventscheduler/widgets/todocards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/todoservice.dart';

class DoingTodo extends StatelessWidget {
  const DoingTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoService>(
        builder: (context, value, child) {
          return value.done.isEmpty
              ? const MessageWhenListisEmpty(
                  message:
                      'No doing todo added yet, long tap on a todos page to mark a todo as doing',
                )
              : ListView.builder(
                  itemCount: value.doing.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 10, 4),
                      child: TodoCard(
                        todo: value.doing[index],
                        type: todotype.doing,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
