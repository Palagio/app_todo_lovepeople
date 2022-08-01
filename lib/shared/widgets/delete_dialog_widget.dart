import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteDialogWidget extends StatelessWidget {
  final dynamic toDoId;
  final String? toDoTitle;
  const DeleteDialogWidget(
      {Key? key, required this.toDoId, required this.toDoTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.zero,
          width: size.width * 1,
          height: size.height * 0.15,
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.02,
                left: size.width * 0.05,
                child: Text(
                  'Deseja deletar esse item?',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 50, 1, 185),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.05,
                left: size.width * 0.05,
                child: Container(
                  width: size.width * 0.7,
                  child: Text(
                    '\"$toDoTitle\" será movido para lixeira.',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 50, 1, 185),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: size.height * 0.12,
                top: size.height * 0.09,
                child: TextButton(
                  onPressed: () async {
                    await context.read<HomePresenter>().deleteToDos(toDoId);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Confirmar',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 50, 1, 185),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: size.height * 0.01,
                top: size.height * 0.09,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 169, 1, 247),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
