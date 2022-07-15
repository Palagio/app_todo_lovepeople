import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/new_task_form_field_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/text_form_field_widget.dart';

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
            top: size.height * 0.63,
            left: size.width * 0.01,
            child: Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ColorBoxSelection(),
                  // ColorBoxSelection(),
                  // ColorBoxSelection(),
                  // ColorBoxSelection(),
                  // ColorBoxSelection(),
                ],
              ),
            ),
          )
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
                  Navigator.pushNamed(context, '/home');
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
                  Navigator.pushNamed(context, '/add_new');
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

  InkWell ColorBoxSelection(color) {
    Color? color;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
