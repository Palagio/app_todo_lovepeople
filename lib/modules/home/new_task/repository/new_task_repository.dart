import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Future<List<NewTaskModel>> getTodos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    List<NewTaskModel> listTodo = [];
    var token = sharedPreferences.getString('jwt')!;
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('jwt')!;
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    final body1 = jsonEncode(body);

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

  Future<http.Response> delTodos(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos/$id');
    var token = sharedPreferences.getString('jwt')!;
    final http.Response response = await http.delete(
      url,
      headers: {
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      },
    );
    print(id);
    return response;
  }
}
