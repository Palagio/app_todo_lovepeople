import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';

import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';
import 'package:flutter/cupertino.dart';

class AddNewTaskController extends ChangeNotifier {
  final NewTaskRepository repository;

  AddNewTaskController(this.repository);

  List<NewTaskModel> listTodos = [];

  void getTodos() async {
    listTodos = await repository.getTodos();
    notifyListeners();
  }

  void postTodos(String title, String description, String color) async {
    repository.postTodos(
        body: {'title': title, 'description': description, 'color': color});
    notifyListeners();
  }
}
