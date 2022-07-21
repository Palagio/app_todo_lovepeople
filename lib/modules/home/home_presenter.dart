import 'package:app_todo_lovepeople/modules/home/home_model.dart';
import 'package:flutter/material.dart';

class HomePresenter with ChangeNotifier {
  final HomeModel homeModel;
  HomePresenter(
    this.homeModel,
  );


}
