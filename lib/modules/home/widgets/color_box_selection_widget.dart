import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorBoxSelectionWidget extends StatelessWidget {
  final int color;
  final void Function() onTap;

  const ColorBoxSelectionWidget({
    Key? key,
    required this.color,required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AddNewTaskPresenter>(builder: (context, presenter, child) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: size.width * 0.11,
          height: size.width * 0.11,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(color).withOpacity(1),
          ),
        ),
      );
    });
  }
}
