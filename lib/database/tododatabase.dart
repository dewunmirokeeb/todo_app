import 'package:eventscheduler/models/todo.dart';
import 'package:eventscheduler/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoDataBase {
  static final TodoDataBase instance = TodoDataBase._initialize();
  static Database? _database;
  TodoDataBase._initialize();

  Future _createdb(Database db, int version) async {
    const userusernametype = 'Text primary key not null';
    const texttype = 'Text Not Null';
    const booltype = 'Bool not null';

    await db.execute('''
        create table $usertable(
            ${UserFields.username} $userusernametype,
            ${UserFields.name}  $texttype,
        )''');

    await db.execute('''
        create table $todotable(
            ${TodoFields.username} $texttype,
            ${TodoFields.title}  $texttype,
            ${TodoFields.done}  $booltype,
            ${TodoFields.starred}  $booltype,
            ${TodoFields.doing}  $booltype,
            ${TodoFields.created}  $texttype,
            FOREIGN KEY (${TodoFields.username}) REFEREMCES $usertable (${UserFields.username}),
        )''');
  }

  Future _onconfigure(Database db) async {
    await db.execute('');
  }

  Future<Database> _initdb(String filename) async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, filename);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createdb,
      onConfigure: _onconfigure,
    );
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initdb('todo.db');
      return _database;
    }
  }

  Future<User> createuser(User user) async {
    final db = await instance.database;
    await db!.insert(usertable, user.tojson());
    return user;
  }

  Future<User> getUser(String username) async {
    final db = await instance.database;
    final maps = await db!.query(
      usertable,
      columns: UserFields.allFields,
      where: '${UserFields.username} = ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return User.fromjson(maps.first);
    } else {
      throw Exception('$username not found in the data base.');
    }
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final results = await db!.query(
      usertable,
      orderBy: '${UserFields.username} ASC',
    );
    return results.map((e) => User.fromjson(e)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return db!.update(
      usertable,
      user.tojson(),
      where: '${UserFields.username} = ?',
      whereArgs: [user.username],
    );
  }

  Future<int> deleteUser(String username) async {
    final db = await instance.database;
    return db!.delete(
      usertable,
      where: '${UserFields.username} = ?',
      whereArgs: [username],
    );
  }

  Future<Todo> createTodo(Todo todo) async {
    final db = await instance.database;
    await db!.insert(todotable, todo.tojson());
    return todo;
  }

  Future<int> toggletododone(Todo todo) async {
    final db = await instance.database;
    todo.done = !todo.done;
    return db!.update(
      todotable,
      todo.tojson(),
      where: '${TodoFields.title} = ? AND ${TodoFields.username} = ?',
      whereArgs: [todo.title, todo.username],
    );
  }

  Future<int> toggletododstarred(Todo todo) async {
    final db = await instance.database;
    todo.starred = !todo.starred;
    return db!.update(
      todotable,
      todo.tojson(),
      where: '${TodoFields.title} = ? AND ${TodoFields.username} = ?',
      whereArgs: [todo.title, todo.username],
    );
  }

  Future<int> toggletododdoing(Todo todo) async {
    final db = await instance.database;
    todo.doing = !todo.doing;
    return db!.update(
      todotable,
      todo.tojson(),
      where: '${TodoFields.title} = ? AND ${TodoFields.username} = ?',
      whereArgs: [todo.title, todo.username],
    );
  }

  Future<List<Todo>> gettodo(String username) async {
    final db = await instance.database;
    final result = await db!.query(
      todotable,
      orderBy: '${TodoFields.created} DESC',
      where: '${TodoFields.username} = ?',
      whereArgs: [username],
    );
    return result.map((e) => Todo.fromjson(e)).toList();
  }

  Future<int> deleteTodo(Todo todo) async {
    final db = await instance.database;
    return db!.delete(
      todotable,
      where: '${TodoFields.title} = ? AND ${TodoFields.username} = ?',
      whereArgs: [todo.title, todo.username],
    );
  }
}
