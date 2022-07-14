import 'package:app_todo_lovepeople/modules/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthPresenter with ChangeNotifier {
  final AuthModel authModel;
  AuthPresenter(this.authModel);

  void toggle(BoolValue status) {
    status.toggle(status);
    notifyListeners();
  }


}
