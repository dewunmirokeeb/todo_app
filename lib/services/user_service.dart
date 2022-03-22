import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  String getHumanReadableError(String message) {
    if (message.contains('UNIQUE constraint fail')) {
      return 'This user already exist in the data base, please choose a new user name';
    }
    if (message.contains('not found in the data ase')) {
      return 'The user does not exist in the database. please regster first';
    }
    return message;
  }
}
