import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User get user => _user!;

  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    _user = await _authMethods.getUserDetails();
    notifyListeners();
  }
}
