import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'package:flutter/cupertino.dart';

abstract class NewTaskRepository {
  Future<NewTaskModel> postTodos(String title, String description, Color color);
  Future<List<NewTaskModel>> getTodos(String title, String description, Color color);
}
