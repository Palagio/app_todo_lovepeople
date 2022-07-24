import 'dart:async';
import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/model/add_new_task_json.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class AddNewTaskRepository {
 List<ToDo> toDoList = [];


  Future<List<ToDo>> getToDos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
  

    Map<String, String> headers = {
      'Authorization': 'Bearer ${sharedPreferences.getString('jwt')}',
    };

    final response = await http.get(url, headers: headers);

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
  
}
