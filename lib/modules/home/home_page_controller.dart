import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/repository/new_task_repository.dart';
import 'package:flutter/cupertino.dart';

class HomePageController extends ChangeNotifier {
  final Repository repository;

  List<NewTaskModel> listTodos = [];
  List<NewTaskModel> listToShow = [];

  HomePageController(this.repository);

  void getTodos() async {
    listTodos = await repository.getTodos();
    notifyListeners();
  }

  void load() {
    listToShow = listTodos;
  }

  void onChangeText(String value) async {
    listToShow = listTodos.where((element) {
      return element.title
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void delete(int id) async {
    await repository.delTodos(id);
    notifyListeners();
  }
}
