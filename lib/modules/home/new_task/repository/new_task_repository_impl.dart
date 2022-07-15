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
    final result = await http.get(url);

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
  Future<NewTaskModel> postTodos(String title, String description, Color color) {
    
    throw UnimplementedError();
  }
}
