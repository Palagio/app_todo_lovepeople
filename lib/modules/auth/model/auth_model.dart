class AuthModel {
  BoolValue obscurePasswordStatus = BoolValue();

  BoolValue obscurePasswordConfirmStatus = BoolValue();

  String username = '';

  String password = '';

  bool isLoginValid = false;
}

class BoolValue {
  bool value = true;
  toggle(BoolValue) {
    value = !value;
  }
}
