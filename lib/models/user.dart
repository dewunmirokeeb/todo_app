class UserFields {
  static const String username = 'username';
  static const String name = 'name';
  static final List<String> allFields = [
    username,
    name,
  ];
}

class User {
  final String username;
  final String name;

  User({
    required this.username,
    required this.name,
  });
}
