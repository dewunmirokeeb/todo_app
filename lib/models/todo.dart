import 'package:flutter/rendering.dart';

const String todotable = 'todo';
const String doingtable = 'doing';
const String startable = 'star';
const String donetable = 'done';

class TodoFields {
  static const String username = 'username';
  static const String title = 'title';
  static const String done = 'done';
  static const String doing = 'doing';
  static const String starred = 'stared ';
  static const String created = 'created';
  static final List<String> allFields = [
    username,
    title,
    done,
    doing,
    created,
    starred,
  ];
}

class Todo {
  final String username;
  final String title;
  bool done;
  final DateTime created;
  bool starred;
  bool doing;

  Todo({
    required this.username,
    required this.title,
    this.done = false,
    required this.created,
    this.doing = false,
    this.starred = false,
  });

  Map<String, Object?> tojson() => {
        TodoFields.username: username,
        TodoFields.title: title,
        TodoFields.created: created.toIso8601String(),
        TodoFields.done: done ? 1 : 0,
        TodoFields.starred: starred ? 1 : 0,
        TodoFields.doing: doing ? 1 : 0,
      };

  static Todo fromjson(Map<String, Object?> json) => Todo(
        username: json[TodoFields.username] as String,
        title: json[TodoFields.title] as String,
        created: DateTime.parse(json[TodoFields.created] as String),
        done: json[TodoFields.done] == 1 ? true : false,
        starred: json[TodoFields.starred] == 1 ? true : false,
        doing: json[TodoFields.doing] == 1 ? true : false,
      );

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(covariant Todo todo) {
    // ignore: unnecessary_this
    return (this.username == todo.username) &&
        // ignore: unnecessary_this
        (this.title.toUpperCase().compareTo(todo.title.toUpperCase()) == 0);
  }

  @override
  int get hashCode => hashValues(username, title);
}
