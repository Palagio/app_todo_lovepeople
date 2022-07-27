import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  String username = '';

  String password = '';

  String token = '';

  bool isAuthValid = false;

  Future postUserAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> userDataJson = {
      'identifier': username,
      'password': password
    };

    var json = jsonEncode(userDataJson);

    Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      var response = await http.post(
        Uri.parse(
          'https://todo-lovepeople.herokuapp.com/auth/local',
        ),
        headers: headers,
        body: json,
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        token = body['jwt'];
        await sharedPreferences.setString('jwt', "${token}");
        token = sharedPreferences.getString('jwt')!;
        isAuthValid = true;
      }
    } catch (e) {
      print(e);
    }
  }
}
