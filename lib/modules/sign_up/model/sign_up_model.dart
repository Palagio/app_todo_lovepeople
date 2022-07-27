class SignUpModel {
  SignUpBoolValue obscurePasswordStatus = SignUpBoolValue();

  SignUpBoolValue obscurePasswordConfirmStatus = SignUpBoolValue();
}

class SignUpBoolValue {
  bool value = true;
  toggle(SignUpBoolValue) {
    value = !value;
  }
}
