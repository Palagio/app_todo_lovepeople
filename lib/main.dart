import 'package:app_todo_lovepeople/app_widget.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_model.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_controller.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final repository = NewTaskRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthPresenter(AuthModel()),
        ),
        ChangeNotifierProvider<AddNewTaskController>(
          create: (context) => AddNewTaskController(repository),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
