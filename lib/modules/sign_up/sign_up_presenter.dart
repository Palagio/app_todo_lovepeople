import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpPresenter with ChangeNotifier {
  final SignUpModel signUpModel;
  SignUpPresenter(
    this.signUpModel,
  );

  Future postUserData() async {
    var passwordInt = int.parse(signUpModel.password);

    Map<dynamic, dynamic> userDataJson = {
      'username': signUpModel.username,
      'email': signUpModel.email,
      'password': passwordInt
    };

    var json = jsonEncode(userDataJson);

    Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      var response = await http.post(
        Uri.parse(
          'https://todo-lovepeople.herokuapp.com/auth/local/register',
        ),
        headers: headers,
        body: json,
      );
      print(response.body);
      print(response.statusCode);
      print(userDataJson);
    } catch (e) {
      print(e);
    }
  }

  validateSignUp() {
    validateUsername();
    validateEmail();
    validatePassword();
    if (signUpModel.isEmailValid == true &&
        signUpModel.isUsernameSignupValid == true &&
        signUpModel.isPasswordValid == true) {
      return signUpModel.isSignUpValid = true;
    } 
  }

  validatePassword() {
    if (signUpModel.password == signUpModel.confirmPassword &&
        signUpModel.confirmPassword.length >= 6 &&
        signUpModel.password.length >= 5) {
      return {
        signUpModel.isPasswordValid = true,
      };
    } else {
      return false;
    }
  }

  validateEmail() {
    if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(signUpModel.email)) {
      return signUpModel.isEmailValid = true;
    }
  }

  validateUsername() {
    if (signUpModel.username.trim().length < 3) return;
    if (signUpModel.username.trim().split(' ').length < 2) return;
    if (!RegExp("[a-zA-Z\u00C0-\u00FF]").hasMatch(signUpModel.username)) return;
    return {
      signUpModel.isUsernameSignupValid = true,
    };
  }

  setUsername(String value) => signUpModel.username = value;

  setNumberEmailCpf(String value) => signUpModel.email = value;

  setPassword(String value) => signUpModel.password = value;

  setConfirmPassword(String value) => signUpModel.confirmPassword = value;

  void toggle(SignUpBoolValue status) {
    status.toggle(status);
    notifyListeners();
  }
}
