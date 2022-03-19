class TodoFields {
  static const String username = 'username';
  static const String title = 'title';
  static const String done = 'done';
  static const String created = 'created';
  static final List<String> allFields = [
    username,
    title,
    done,
    created,
  ];
}

class Todo {
  final String username;
  final String title;
  bool done;
  final DateTime created;

  Todo({
    required this.username,
    required this.title,
    this.done = false,
    required this.created,
  });
}
