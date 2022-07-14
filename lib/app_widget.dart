import 'package:app_todo_lovepeople/modules/auth/auth_view.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
         '/signUpView': (context) =>  SignUpView(),     
      },
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthView(),
    );
  }
}