import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpPresenter with ChangeNotifier {
  final SignUpModel signUpModel;
  SignUpPresenter(
    this.signUpModel,
  );

  postData() {
    signUpModel.postUserData();
  }

  setUsername(String value) => signUpModel.username = value;

  validateUsername(String value) {
    if (value.trim().length < 3) return;
    if (value.trim().split(' ').length < 2) return;
    if (!RegExp("[a-zA-Z\u00C0-\u00FF]").hasMatch(value)) return;
    return {signUpModel.isUsernameSignupValid = true,
    print(signUpModel.isUsernameSignupValid),
    };
  }

  setNumberEmailCpf(String value) => signUpModel.numberEmailCpf = value;

  setPassword(String value) => signUpModel.password = value;

  setConfirmPassword(String value) => signUpModel.confirmPassword = value;

  void toggle(SignUpBoolValue status) {
    status.toggle(status);
    notifyListeners();
  }
}
