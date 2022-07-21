import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:flutter/material.dart';

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
    var passwordInt = int.parse(authModel.password);

    Map<String, dynamic> userDataJson = {
      'username': authModel.username,
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
