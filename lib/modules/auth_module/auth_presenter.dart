import 'package:app_todo_lovepeople/modules/auth_module/auth_model.dart';
import 'package:flutter/material.dart';

class AuthPresenter with ChangeNotifier {
 final AuthModel authModel;
  AuthPresenter(this.authModel);

  void switchObscureTextStatus() {
    authModel.obscureTextStatus = !authModel.obscureTextStatus;
    notifyListeners();
  }
}
