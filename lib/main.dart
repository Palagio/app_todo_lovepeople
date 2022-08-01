import 'package:app_todo_lovepeople/app_widget.dart';
import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:app_todo_lovepeople/modules/auth/model/repositories/auth_repository.dart';
import 'package:app_todo_lovepeople/modules/home/home/model/home_model.dart';
import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/home/model/repositories/home_repository.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/model/add_new_task_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/model/repositories/sign_up_repository.dart';
import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthPresenter(AuthModel(), AuthRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SignUpPresenter(SignUpModel(), SignUpRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AddNewTaskPresenter(AddNewTaskModel(), HomeRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePresenter(
            HomeModel(),
            HomeRepository(),
          ),
        ),

      ],
      child: AppWidget(),
    ),
  );
}
