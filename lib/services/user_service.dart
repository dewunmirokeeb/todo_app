import 'package:eventscheduler/database/tododatabase.dart';
import 'package:eventscheduler/models/user.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  late User _currentuser;
  bool _busycreate = false;
  bool _userexist = false;

  User get currentuser => _currentuser;
  bool get busycreate => _busycreate;
  bool get userexist => _userexist;

  set userexist(bool value) {
    _userexist = value;
    notifyListeners();
  }

  Future<String> getuser(String username) async {
    String result = 'ok';
    try {
      _currentuser = await TodoDataBase.instance.getUser(username);
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }
    return result;
  }

  Future<String> checkifuserexist(String username) async {
    String result = 'ok';
    try {
      await TodoDataBase.instance.getUser(username);
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }
    return result;
  }

  Future<String> updatethecurrentuser(String username) async {
    String result = 'ok';
    _currentuser.name = username;
    notifyListeners();
    try {
      await TodoDataBase.instance.updateUser(_currentuser);
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }
    return result;
  }

  Future<String> createuser(User user) async {
    String result = 'ok';
    _busycreate = true;
    notifyListeners();
    try {
      await TodoDataBase.instance.createuser(user);
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }
    _busycreate = false;
    return result;
  }
}

String getHumanReadableError(String message) {
  if (message.contains('UNIQUE constraint fail')) {
    return 'This user already exist in the data base, please choose a new user name';
  }
  if (message.contains('not found in the data ase')) {
    return 'The user does not exist in the database. please regster first';
  }
  return message;
}
