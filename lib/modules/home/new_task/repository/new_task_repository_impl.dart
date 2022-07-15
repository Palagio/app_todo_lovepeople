import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';

class NewTaskRepositoryImpl implements NewTaskRepository {
  @override
  Future<List<NewTaskModel>> getTodos(
      String title, String description, Color color) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    List<NewTaskModel> listTodos = [];
    final result = await http.get(url, headers: {
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTM2LCJpYXQiOjE2NTc5MTAxMTksImV4cCI6MTY2MDUwMjExOX0.ZSNNbYk8OrG1jNJTMYBMRAQDYDPp84FKxddxoWA_ZDw"
    });

    if (result.statusCode == 200) {
      Map json = const JsonDecoder().convert(result.body);

      for (var e in (json['data'] as List)) {
        listTodos.add(NewTaskModel.fromJson(e));
      }
      return listTodos;
    }

    return listTodos;
  }

  @override
  Future<NewTaskModel> postTodos(
      String title, String description, Color color) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    http.post(
      url,
      body: {
        "title": title,
        "description": description,
        "color": color,
      },
      headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTM2LCJpYXQiOjE2NTc5MTAxMTksImV4cCI6MTY2MDUwMjExOX0.ZSNNbYk8OrG1jNJTMYBMRAQDYDPp84FKxddxoWA_ZDw"
      },
    );

    throw UnimplementedError();
  }
}
