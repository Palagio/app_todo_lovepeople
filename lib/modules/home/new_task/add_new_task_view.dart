import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_controller.dart';
import 'package:app_todo_lovepeople/shared/widgets/text_form_field_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/new_task_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:validatorless/validatorless.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({Key? key}) : super(key: key);

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleEC = TextEditingController();
  final TextEditingController _descriptionEC = TextEditingController();
  int? _colorEC;

  // final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.05,
              child: UserTextFormFieldWidget(
                controller: _titleEC,
                hintText: 'Título da Tarefa',
                // validator: Validatorless.required('Título obrigatório'),
              ),
            ),
            Positioned(
              top: size.height * 0.135,
              left: size.width * 0.05,
              child: NewTaskFormFieldWidget(
                controller: _descriptionEC,
                hintText: 'Escreva uma descrição para sua tarefa.',
                // validator: Validatorless.required('Descrição obrigatória'),
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
                    ColorBoxSelection(0xFFF2CC),
                    ColorBoxSelection(0xFFD9F0),
                    ColorBoxSelection(0xE8C5FF),
                    ColorBoxSelection(0xCAFBFF),
                    ColorBoxSelection(0xE3FFE6),
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
          Consumer<AddNewTaskController>(
            builder: ((context, controller, _) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid && _colorEC != null) {
                        controller.postTodos(
                          _titleEC.text,
                          _descriptionEC.text,
                          _colorEC.toString(),
                        );
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Image.asset(
                      'assets/images/shared/verify.png',
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  ColorBoxSelection(int? color) {
    return InkWell(
      onTap: () {
        _colorEC = color;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(color ?? 16773836).withOpacity(1),
          ),
        ),
      ),
    );
  }
}
