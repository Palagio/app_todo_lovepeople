import 'package:app_todo_lovepeople/modules/sign_up/model/repositories/sign_up_repository.dart';
import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpPresenter with ChangeNotifier {
  final SignUpModel signUpModel;
  final SignUpRepository signUpRepository;
  SignUpPresenter(
    this.signUpModel,
    this.signUpRepository,
  );

  bool isUsernameSignupValid = false;

  bool isPasswordValid = false;

  bool isEmailValid = false;

  bool isSignUpValid = false;

  bool isSignUpButtonLoading = false;

  String confirmPassword = '';

  validateSignUp() {
    validateUsername();
    validateEmail();
    validatePassword();
    if (isEmailValid == true &&
        isUsernameSignupValid == true &&
        isPasswordValid == true) {
      return isSignUpValid = true;
    }
  }

  validatePassword() {
    if (signUpRepository.password == confirmPassword &&
        confirmPassword.length >= 6 &&
        signUpRepository.password.length >= 5) {
      return {
        isPasswordValid = true,
      };
    } else {
      return false;
    }
  }

  validateEmail() {
    if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(signUpRepository.email)) {
      return isEmailValid = true;
    }
  }

  validateUsername() {
    if (signUpRepository.username.trim().length < 3) return;
    if (signUpRepository.username.trim().split(' ').length < 2) return;
    if (!RegExp("[a-zA-Z\u00C0-\u00FF]").hasMatch(signUpRepository.username))
      return;
    return {
      isUsernameSignupValid = true,
    };
  }

  setUsername(String value) => signUpRepository.username = value;

  setNumberEmailCpf(String value) {
    signUpRepository.email = value;
  }

  setPassword(String value) => signUpRepository.password = value;

  setConfirmPassword(String value) => confirmPassword = value;

  void toggle(SignUpBoolValue status) {
    status.toggle(status);
    notifyListeners();
  }
}
