import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _user = 'John Doe';
  String get user => _user;
  bool get userExists => (_user != null) ? true : false;

  set user(String user) {
    _user = user;
    notifyListeners();
  }
}