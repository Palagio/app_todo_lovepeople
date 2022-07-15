import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';


class SignUpPresenter with ChangeNotifier {
  final SignUpModel signUpModel;
  SignUpPresenter(
    this.signUpModel,
  );

  postData() {}
  

  
  setUsername(String value) {
    signUpModel.username = value;
    print(signUpModel.username);
  }

  setNumberEmailCpf(String value) {
   signUpModel.numberEmailCpf = value;
    print(signUpModel.numberEmailCpf);
  }

  setPassword(String value) {
    signUpModel.password = value;
  }

  setConfirmPassword(String value) {
    signUpModel.password = value;
  }

  void toggle(SignUpBoolValue status) {
    status.toggle(status);
    notifyListeners();
  }
}
