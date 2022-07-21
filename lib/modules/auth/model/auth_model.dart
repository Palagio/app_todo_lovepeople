class AuthModel {
  BoolValue obscurePasswordStatus = BoolValue();

  BoolValue obscurePasswordConfirmStatus = BoolValue();

  String username = '';

  String password = '';

  String token = '';

  bool isUserLogged = false;

  bool isUsernameValid = false;

  bool isPasswordValid = false;

  bool isAuthValid = false;
}

class BoolValue {
  bool value = true;
  toggle(BoolValue) {
    value = !value;
  }
}
