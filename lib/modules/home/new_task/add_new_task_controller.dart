import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class AddNewTaskController extends ChangeNotifier {
  final NewTaskRepositoryImpl repository;

  AddNewTaskController(this.repository);

  List<NewTaskModel> listTodos = [];

  void getTodos() async {
    listTodos = await repository.getTodos();
  }
}
