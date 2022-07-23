import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';
import 'package:flutter/cupertino.dart';

class AddNewTaskController extends ChangeNotifier {
  final Repository repository;

  AddNewTaskController(this.repository);

  void postTodos(String title, String description, String color) async {
    repository.postTodos(
        body: {'title': title, 'description': description, 'color': color});
    notifyListeners();
  }

  
}
