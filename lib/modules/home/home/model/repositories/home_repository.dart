import 'dart:async';
import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/model/add_new_task_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<List<ToDo>> getToDos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    Map<String, String> headers = {
      'Authorization': 'Bearer ${sharedPreferences.getString('jwt')}',
    };

    final response = await http.get(url, headers: headers);
    List<ToDo> toDoList = [];
    
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> json = const JsonDecoder().convert(response.body);

      for (var element in json) {
        toDoList.add(ToDo.fromJson(element));
      }
    }
    print(toDoList);
    return toDoList;
  }

  Future<http.Response> delTodos(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos/$id');
    String? token = sharedPreferences.getString('jwt');
    final http.Response response = await http.delete(
      url,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );
    print(response.statusCode);

    return response;
  }
}
