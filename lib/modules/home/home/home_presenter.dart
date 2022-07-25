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

  setSearchText(String value) { 
    homeModel.searchText;
     homeRepository.listToShow = homeRepository.toDoList.where((element) {
      return element.title
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    notifyListeners();}



  getToDos() async {
    await homeRepository.getToDos();
    notifyListeners();
  }
}
