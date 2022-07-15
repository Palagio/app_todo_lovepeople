extension StringExtension on String {
  bool isEmailNotValid() {
    return !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(this);
  }

    isNameNotValid() {
    if (this.trim().length < 3) return true;
    if (this.trim().split(' ').length < 2) return true;
    if (!RegExp("[a-zA-Z\u00C0-\u00FF]").hasMatch(this)) return true;
    return false;
  }

  bool isPasswordNotValid() {
    return !RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}