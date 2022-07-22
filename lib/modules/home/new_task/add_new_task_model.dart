import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_json.dart';
import 'package:flutter/material.dart';

class AddNewTaskModel {

  List<ToDo> toDoList = [];

  String newTaskTitle = '';

  String newTaskDescription = '';

  dynamic newTaskColorId = '';

  Color currentColor = Colors.white;

  Color color1 = Color.fromARGB(255, 255, 242, 204);

  Color color2 = Color.fromARGB(255, 255, 217, 240);

  Color color3 = Color.fromARGB(255, 232, 197, 255);

  Color color4 = Color.fromARGB(255, 202, 251, 255);

  Color color5 = Color.fromARGB(255, 227, 255, 230);
}
