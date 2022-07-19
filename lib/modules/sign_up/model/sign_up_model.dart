class SignUpModel {
  SignUpBoolValue obscurePasswordStatus = SignUpBoolValue();

  SignUpBoolValue obscurePasswordConfirmStatus = SignUpBoolValue();

  bool isUsernameSignupValid = false;

  bool isPasswordValid = false;

  bool isEmailValid = false;

  bool isSignUpValid = false;

  bool isSignUpButtonLoading = false;

  String username = '';

  String email = '';

  String password = '';

  String confirmPassword = '';
}

class SignUpBoolValue {
  bool value = true;
  toggle(SignUpBoolValue) {
    value = !value;
  }
}
