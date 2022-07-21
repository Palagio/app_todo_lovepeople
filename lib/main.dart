import 'package:app_todo_lovepeople/app_widget.dart';
import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/home_model.dart';
import 'package:app_todo_lovepeople/modules/home/home_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_presenter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthPresenter(AuthModel()),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpPresenter(SignUpModel()),
        ),
        ChangeNotifierProvider(
          create: (context) => AddNewTaskPresenter(AddNewTaskModel()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePresenter(HomeModel()),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
