import 'package:http/http.dart' as http;

class SignUpModel {

  SignUpBoolValue obscurePasswordStatus = SignUpBoolValue();

  SignUpBoolValue obscurePasswordConfirmStatus = SignUpBoolValue();

  late String username;

  late String numberEmailCpf;

  late String password;

  late String confirmPassword;



  Future postUserData() async {
    try {
      var response = await http.post(
          Uri.parse(
              ' https://todo-lovepeople.herokuapp.com/auth/local/register'),
          body: {
            'username': username,
            'email': numberEmailCpf,
            'password': password
          });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}

class SignUpBoolValue {
  bool value = true;
  toggle(SignUpBoolValue) {
    value = !value;
  }
}
