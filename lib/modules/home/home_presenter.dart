import 'package:app_todo_lovepeople/modules/home/home_model.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/model/repositories/add_new_task_repository.dart';
import 'package:flutter/material.dart';

class HomePresenter with ChangeNotifier {
  final AddNewTaskRepository addNewTaskRepository;
  final HomeModel homeModel;
  HomePresenter(
    this.homeModel,
    this.addNewTaskRepository,
  );


  getToDos() async {
    await addNewTaskRepository.getToDos();
    homeModel.toDoList = addNewTaskRepository.toDoList;
    notifyListeners();
  }
}
