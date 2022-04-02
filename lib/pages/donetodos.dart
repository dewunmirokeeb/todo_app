import 'package:eventscheduler/constants/colorconstants.dart';
import 'package:eventscheduler/enums/todotypeenum.dart';
import 'package:eventscheduler/services/todoservice.dart';
import 'package:eventscheduler/widgets/messagewhenlistisempty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/todocards.dart';

class DoneTodo extends StatelessWidget {
  const DoneTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Constantcolors.mainappbackgroundcolor1,
              child: Stack(children: [
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 100,
                  child: Text(
                    'Done Todoos',
                    style: GoogleFonts.caveat(
                      color: Colors.red.withGreen(10000),
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 5,
            child: Consumer<TodoService>(
              builder: (context, value, child) {
                return value.done.isEmpty
                    ? const MessageWhenListisEmpty(
                        message:
                            'No done todo yet long press any done todo task in todoos, starred todo or doing todo and hit  mark as save on the pop up to save to done todo',
                      )
                    : ListView.builder(
                        itemCount: value.done.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 10, 4),
                            child: TodoCard(
                              todo: value.done[index],
                              type: todotype.done,
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
