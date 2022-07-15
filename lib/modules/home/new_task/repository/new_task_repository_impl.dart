import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';

import 'package:http/http.dart' as http;

class NewTaskRepositoryImpl {
  Future<List<NewTaskModel>> getTodos() async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    List<NewTaskModel> listTodo = [];
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTM2LCJpYXQiOjE2NTc5MTAxMTksImV4cCI6MTY2MDUwMjExOX0.ZSNNbYk8OrG1jNJTMYBMRAQDYDPp84FKxddxoWA_ZDw';
    final result = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (result.statusCode == 200) {
      List json = const JsonDecoder().convert(result.body);

      for (var e in json) {
        listTodo.add(NewTaskModel.fromJson(e));
      }

      return listTodo;
    }

    return listTodo;
  }
}

  // @override
  // Future<NewTaskModel> postTodos(
  //     String title, String description, Color color) async {
  //   var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
  //   http.post(
  //     url,
  //     body: {
  //       "title": title,
  //       "description": description,
  //       "color": color,
  //     },
  //     headers: {
  //       "Authorization":
  //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTM2LCJpYXQiOjE2NTc5MTAxMTksImV4cCI6MTY2MDUwMjExOX0.ZSNNbYk8OrG1jNJTMYBMRAQDYDPp84FKxddxoWA_ZDw"
  //     },
  //   );

  //   throw UnimplementedError();
  // }

