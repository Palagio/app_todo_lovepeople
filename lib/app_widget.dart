import 'package:app_todo_lovepeople/modules/auth/auth_view.dart';
import 'package:app_todo_lovepeople/modules/auth/waiting_view.dart';
import 'package:app_todo_lovepeople/modules/home/home_view.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_view.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/sign_up_view': (context) => SignUpView(),
        '/home': (context) => HomeView(),
        '/add_new': (context) => AddNewTaskView(),
        '/auth_view': (context) => AuthView(),
        '/splash_view': (context) => SplashView(),
      },
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash_view',
    );
  }
}
