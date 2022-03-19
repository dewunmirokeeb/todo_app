import 'package:eventscheduler/pages/current_todo.dart';
import 'package:eventscheduler/pages/future_todo.dart';
import 'package:eventscheduler/pages/total_todos.dart';
import 'package:flutter/material.dart';
import '../constants/colorconstants.dart';
import '../methods/alertshowdialog.dart';
import '../models/user_profile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late TextEditingController todotitlecontroller;
  late TextEditingController moretodoinfocontroller;
  @override
  void initState() {
    super.initState();
    todotitlecontroller = TextEditingController();
    moretodoinfocontroller = TextEditingController();
  }

  @override
  void dispose() {
    todotitlecontroller.dispose();
    moretodoinfocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constantcolors.mainappbackgroundcolor1,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    alertdialogmethod(
                      context,
                      todotitlecontroller,
                      moretodoinfocontroller,
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  );
                }),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.folder,
                ),
                text: 'Future Todo',
              ),
              Tab(
                icon: Icon(
                  Icons.folder_open,
                ),
                text: 'Current Todo',
              ),
              Tab(
                icon: Icon(
                  Icons.create_new_folder,
                ),
                text: 'Total todos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FutureTodo(),
            CurrentTodo(),
            TotalTodos(),
          ],
        ),
        endDrawer: const UserProfile(),
      ),
    );
  }
}
