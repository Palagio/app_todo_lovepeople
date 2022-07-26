import 'package:app_todo_lovepeople/modules/home/home/model/home_model.dart';
import 'package:app_todo_lovepeople/modules/home/home/model/repositories/home_repository.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/model/add_new_task_json.dart';
import 'package:flutter/material.dart';

class HomePresenter with ChangeNotifier {
  final HomeRepository homeRepository;
  final HomeModel homeModel;

  HomePresenter(
    this.homeModel,
    this.homeRepository,
  );

  List<ToDo> toDoList = [];

  List<ToDo> listToShow = [];

  setSearchText(String value) {
    homeModel.searchText;
    listToShow = toDoList.where((element) {
      return element.title
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

  deleteToDos(int id) async {
    await homeRepository.delTodos(id);
    getToDos();
  }

  getToDos() async {
    toDoList = await homeRepository.getToDos();
    notifyListeners();
  }
}
