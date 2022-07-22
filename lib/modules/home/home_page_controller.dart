import 'dart:collection';

import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';
import 'package:flutter/cupertino.dart';

class HomePageController extends ChangeNotifier {
  final NewTaskRepository repository;

  List<NewTaskModel> listTodos = [];

  HomePageController(this.repository);
 

  

  