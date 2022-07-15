import 'package:app_todo_lovepeople/modules/home/home_view.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_view.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signUpView': (context) => SignUpView(),
        '/home': (context) => HomeView(),
        '/add_new': (context) => AddNewTaskView(),
      },
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
    );
  }
}
