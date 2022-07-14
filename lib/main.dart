import 'package:app_todo_lovepeople/app_widget.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_model.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthPresenter(AuthModel()),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
