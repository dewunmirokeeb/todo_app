import 'package:eventscheduler/pages/doing.dart';
import 'package:eventscheduler/pages/starred_todos.dart';
import 'package:eventscheduler/pages/todos.dart';
import 'package:flutter/material.dart';
import '../constants/colorconstants.dart';
import '../methods/alertshowdialog.dart';
import '../widgets/user_profile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late TextEditingController todotitlecontroller;
  @override
  void initState() {
    super.initState();
    todotitlecontroller = TextEditingController();
  }

  @override
  void dispose() {
    todotitlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
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
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.folder_open,
                ),
                text: 'Doing',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Starred Todos',
              ),
              Tab(
                icon: Icon(
                  Icons.folder,
                ),
                text: 'Todoos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DoingTodo(),
            StarredTodo(),
            TodosTodo(),
          ],
        ),
        endDrawer: const UserProfile(),
      ),
    );
  }
}
