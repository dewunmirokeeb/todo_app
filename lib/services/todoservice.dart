import 'package:eventscheduler/database/tododatabase.dart';
import 'package:eventscheduler/models/todo.dart';
import 'package:flutter/material.dart';
import '../enums/todotypeenum.dart';

class TodoService with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  List<Todo> _doing = [];
  List<Todo> get doing => _doing;
  List<Todo> _star = [];
  List<Todo> get star => _star;
  List<Todo> _done = [];
  List<Todo> get done => _done;

  void settodoing(
    String username,
  ) async {
    _todos = await TodoDataBase.instance.gettodo(username, todotable);
  }

  void settodone(
    String username,
  ) async {
    _done = await TodoDataBase.instance.gettodo(username, donetable);
  }

  void setdoing(
    String username,
  ) async {
    _doing = await TodoDataBase.instance.gettodo(username, doingtable);
  }

  void setstar(
    String username,
  ) async {
    _star = await TodoDataBase.instance.gettodo(username, startable);
  }

  Future<String> gettodos(String username, todotype type) async {
    if (type == todotype.todos) {
      try {
        settodoing(username);
        notifyListeners();
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.doing) {
      try {
        setdoing(
          username,
        );
        notifyListeners();
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.starr) {
      try {
        setstar(
          username,
        );
        notifyListeners();
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.done) {
      try {
        settodone(
          username,
        );
        notifyListeners();
      } catch (e) {
        return e.toString();
      }
    }
    Future.delayed(const Duration(minutes: 2));
    return 'ok';
  }

  Future<String> deletetodo(Todo todo, todotype type) async {
    if (type == todotype.todos) {
      try {
        await TodoDataBase.instance.deleteTodo(
          todo,
          todotable,
        );
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.doing) {
      try {
        await TodoDataBase.instance.deleteTodo(
          todo,
          doingtable,
        );
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.done) {
      try {
        await TodoDataBase.instance.deleteTodo(
          todo,
          donetable,
        );
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.starr) {
      try {
        await TodoDataBase.instance.deleteTodo(
          todo,
          startable,
        );
      } catch (e) {
        return e.toString();
      }
    }
    String result = await gettodos(todo.username, type);
    return result;
  }

  Future<String> createtodo(Todo todo, todotype type) async {
    if (type == todotype.todos) {
      try {
        await TodoDataBase.instance.createTodo(todo, todotable);
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.doing) {
      try {
        await TodoDataBase.instance.createTodo(todo, doingtable);
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.done) {
      try {
        await TodoDataBase.instance.createTodo(todo, donetable);
      } catch (e) {
        return e.toString();
      }
    } else if (type == todotype.starr) {
      try {
        await TodoDataBase.instance.createTodo(todo, startable);
      } catch (e) {
        return e.toString();
      }
    }
    String result = await gettodos(todo.username, type);
    return result;
  }

  // Future<String> toggletododone(Todo todo, String table) async {
  //   try {
  //     await TodoDataBase.instance.toggletododone(todo, table);
  //   } catch (e) {
  //     return e.toString();
  //   }
  //   String result = await gettodos(todo.username, table);
  //   return result;
  // }
}
