import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter with ChangeNotifier {
  final AuthModel authModel;
  AuthPresenter(this.authModel);

  setUsername(String value) => authModel.username = value;

  setPassword(String value) => authModel.password = value;

  void toggle(BoolValue status) {
    status.toggle(status);
    notifyListeners();
  }

  Future postUserAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> userDataJson = {
      'identifier': authModel.username,
      'password': authModel.password
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
        authModel.token = body['jwt'];
        await sharedPreferences.setString('jwt', "${authModel.token}");
        print(sharedPreferences.getString('jwt'));
        authModel.token = sharedPreferences.getString('jwt')!;
        authModel.isAuthValid = true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future tokenVerify() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString('jwt'));
    if (await sharedPreferences.getString('jwt') != '') {
      authModel.isUserLogged = true;
      notifyListeners();
    }
  }

  Future<bool> exit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}
