import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:app_todo_lovepeople/modules/auth/model/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter with ChangeNotifier {
  final AuthModel authModel;
  final AuthRepository authRepository;
  AuthPresenter(this.authModel, this.authRepository);

  bool isUserLogged = false;

  bool isUsernameValid = false;

  bool isPasswordValid = false;



  setUsername(String value) => authRepository.username = value;

  setPassword(String value) => authRepository.password = value;

  postUserAuth() {
    authRepository.postUserAuth();
    notifyListeners();
  }

  void toggle(BoolValue status) {
    status.toggle(status);
    notifyListeners();
  }

  Future tokenVerify() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (await sharedPreferences.getString('jwt') != '') {
      isUserLogged = true;
      notifyListeners();
    }
  }

  Future<bool> exit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}
