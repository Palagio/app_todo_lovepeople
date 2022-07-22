import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';

import 'package:http/http.dart' as http;

class Repository {
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
    }

    return listTodo;
  }

  Future<NewTaskModel> postTodos({Map? body}) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    final body1 = jsonEncode(body);
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTM2LCJpYXQiOjE2NTc5MTAxMTksImV4cCI6MTY2MDUwMjExOX0.ZSNNbYk8OrG1jNJTMYBMRAQDYDPp84FKxddxoWA_ZDw';
    return http.post(
      url,
      body: body1,
      headers: {
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      },
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception('Erro ao enviar');
      }
      return NewTaskModel.fromJson(json.decode(response.body));
    });
  }
}
