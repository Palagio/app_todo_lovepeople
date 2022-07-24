import 'package:app_todo_lovepeople/modules/home/home/model/home_model.dart';
import 'package:app_todo_lovepeople/modules/home/home/model/repositories/home_repository.dart';
import 'package:flutter/material.dart';

class HomePresenter with ChangeNotifier {
  final HomeRepository homeRepository;
  final HomeModel homeModel;
  HomePresenter(
    this.homeModel,
    this.homeRepository,
  );


  getToDos() async {
    await homeRepository.getToDos();
    notifyListeners();
  }



}
