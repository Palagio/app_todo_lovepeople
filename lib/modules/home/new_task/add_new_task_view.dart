import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/color_box_selection_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/new_task_form_field_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({Key? key}) : super(key: key);

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddNewTaskPresenter>(builder: (context, presenter, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 169, 1, 247),
        appBar: AppBarWidget(
          title: 'Nova Tarefa',
          height: size.height * 0.15,
          width: size.width * 0.25,
          padding: size.width * 0.05,
        ),
        body: Form(
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.05,
                left: size.width * 0.05,
                child: UserTextFormFieldWidget(
                  onChanged: presenter.setNewTaskTitle,
                  hintText: 'Título da Tarefa',
                ),
              ),
              Positioned(
                top: size.height * 0.135,
                left: size.width * 0.05,
                child: NewTaskFormFieldWidget(
                  color: presenter.addNewTaskModel.currentColor,
                  onChanged: presenter.setNewTaskDescription,
                  hintText: 'Escreva uma descrição para sua tarefa.',
                ),
              ),
              Positioned(
                top: size.height * 0.49,
                left: size.width * 0.01,
                child: Container(
                  width: size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorBoxSelectionWidget(
                        color: 0xFFF2CC,
                        onTap: presenter.setColor1,
                      ),
                      ColorBoxSelectionWidget(
                        color: 0xFFD9F0,
                        onTap: presenter.setColor2,
                      ),
                      ColorBoxSelectionWidget(
                        color: 0xE8C5FF,
                        onTap: presenter.setColor3,
                      ),
                      ColorBoxSelectionWidget(
                        color: 0xCAFBFF,
                        onTap: presenter.setColor4,
                      ),
                      ColorBoxSelectionWidget(
                        color: 0xE3FFE6,
                        onTap: presenter.setColor5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: SizedBox(
                width: size.width * 0.1,
                height: size.width * 0.1,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/shared/cross.png',
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: SizedBox(
                width: size.width * 0.12,
                child: InkWell(
                  onTap: () async {
                    await presenter.postNewTask();
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Image.asset(
                    'assets/images/shared/verify.png',
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
