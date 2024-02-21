import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;

  bool isLoginClicked = false;

  changeLoggedIn(bool value) {
    isLoggedIn = value;
    notifyListeners();
  }
}