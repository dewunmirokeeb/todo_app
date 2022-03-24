import 'package:eventscheduler/database/tododatabase.dart';
import 'package:eventscheduler/models/todo.dart';
import 'package:flutter/material.dart';

class TodoService with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<String> gettodos(String username) async {
    try {
      _todos = await TodoDataBase.instance.gettodo(username);
      notifyListeners();
    } catch (e) {
      return e.toString();
    }
    return 'ok';
  }

  Future<String> deletetodo(Todo todo) async {
    try {
      await TodoDataBase.instance.deleteTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await gettodos(todo.username);
    return result;
  }

  Future<String> createtodo(Todo todo) async {
    try {
      await TodoDataBase.instance.createTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await gettodos(todo.username);
    return result;
  }

  Future<String> toggletododone(Todo todo) async {
    try {
      await TodoDataBase.instance.toggletododdoing(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await gettodos(todo.username);
    return result;
  }
}
