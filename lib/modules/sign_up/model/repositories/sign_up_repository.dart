import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpRepository{

  String username = '';

  String email = '';

  String password = '';

    Future postUserData() async {
    var passwordInt = int.parse(password);

    Map<dynamic, dynamic> userDataJson = {
      'username': username,
      'email': email,
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
}