import 'dart:async';
import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_json.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddNewTaskRepository {
  Future<List<ToDo>> getToDos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    List<ToDo> toDoList = [];

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('jwt')}',
    };

    final response = await http.get(url);

    print(response.statusCode);


    if (response.statusCode == 200) {
      Map json = const JsonDecoder().convert(response.body);
      print(json);

      for (var element in (json["ToDo"] as List)) {
        toDoList.add(ToDo.fromJson(element));
      }
    }
    return toDoList;
  }
}
