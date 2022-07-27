

class AuthModel {
  BoolValue obscurePasswordStatus = BoolValue();

  BoolValue obscurePasswordConfirmStatus = BoolValue();

}

class BoolValue {
  bool value = true;
  toggle(BoolValue) {
    value = !value;
  }
}
