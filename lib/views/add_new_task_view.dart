import 'package:app_todo_lovepeople/shared/widgets/text_form_field_widget.dart';
import 'package:app_todo_lovepeople/views/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/views/widgets/new_task_form_field_widget.dart';

import 'package:flutter/material.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({Key? key}) : super(key: key);

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      appBar: AppBarWidget(
        title: 'Nova Tarefa',
        height: size.height * 0.15,
        width: size.width * 0.25,
        padding: size.width * 0.05,
      ),
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.05,
            child: UserTextFormFieldWidget(
              hintText: 'Título da Tarefa',
            ),
          ),
          Positioned(
            top: size.height * 0.135,
            left: size.width * 0.05,
            child: const NewTaskFormFieldWidget(
              hintText: 'Escreva uma descrição para sua tarefa.',
            ),
          ),
          Positioned(
              top: size.height * 0.65,
              left: size.width * 0.05,
              child: Row(
                children: [ColorBoxSelection()],
              ))
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home_view');
                },
                child: Image.asset(
                  'assets/images/shared/cross.png',
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/add_view');
                },
                child: Image.asset(
                  'assets/images/shared/cross.png',
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell ColorBoxSelection() {
    return InkWell(
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
