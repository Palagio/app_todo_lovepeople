import 'dart:convert';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNewTaskPresenter with ChangeNotifier {
  final AddNewTaskModel addNewTaskModel;
  AddNewTaskPresenter(this.addNewTaskModel);

  setNewTaskTitle(String value) => addNewTaskModel.newTaskTitle = value;

  setNewTaskDescription(String value) =>
      addNewTaskModel.newTaskDescription = value;

  setNewTaskColor(dynamic value) => addNewTaskModel.newTaskColorId = value;

  setGeneralColor() {
    if (addNewTaskModel.newTaskColorId == '') {
      addNewTaskModel.currentColor = Colors.white;
    }
    if (addNewTaskModel.newTaskColorId == '#FFF2CC') {
      addNewTaskModel.currentColor = addNewTaskModel.color1;
    } else if (addNewTaskModel.newTaskColorId == '#FFD9F0') {
      addNewTaskModel.currentColor = addNewTaskModel.color2;
    }
    if (addNewTaskModel.newTaskColorId == '#E8C5FF') {
      addNewTaskModel.currentColor = addNewTaskModel.color3;
    }
    if (addNewTaskModel.newTaskColorId == '#CAFBFF') {
      addNewTaskModel.currentColor = addNewTaskModel.color4;
    }
    if (addNewTaskModel.newTaskColorId == '#E3FFE6') {
      addNewTaskModel.currentColor = addNewTaskModel.color5;
    }
  }

  setColor1() {
    addNewTaskModel.newTaskColorId = '#FFF2CC';
    setGeneralColor();
    notifyListeners();
  }

  setColor2() {
    addNewTaskModel.newTaskColorId = '#FFD9F0';
    setGeneralColor();
    notifyListeners();
  }

  setColor3() {
    addNewTaskModel.newTaskColorId = '#E8C5FF';
    setGeneralColor();
    notifyListeners();
  }

  setColor4() {
    addNewTaskModel.newTaskColorId = '#CAFBFF';
    setGeneralColor();
    notifyListeners();
  }

  setColor5() {
    addNewTaskModel.newTaskColorId = '#E3FFE6';
    setGeneralColor();
    notifyListeners();
  }

  Future postNewTask() async {
    Map<dynamic, dynamic> userDataJson = {
      'title': addNewTaskModel.newTaskTitle,
      'description': addNewTaskModel.newTaskDescription,
      'color': addNewTaskModel.newTaskColorId,
    };

    var json = jsonEncode(userDataJson);

    Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      var response = await http.post(
        Uri.parse(
          'https://todo-lovepeople.herokuapp.com/todos',
        ),
        headers: headers,
        body: json,
      );
      print(response.body);
      print(response.statusCode);
      print(userDataJson);
    } catch (e) {
      print(e);
    }
  }
}
