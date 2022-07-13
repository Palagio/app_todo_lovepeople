import 'package:app_todo_lovepeople/presenters/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordFormFieldWidget extends StatelessWidget {
  final String hintText;

  PasswordFormFieldWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AuthPresenter>(builder: (context, presenter, child) {
      return SizedBox(
        height: size.height * 0.1,
        width: size.width * 0.9,
        child: TextFormField(
          obscureText: presenter.authModel.obscureTextStatus,
          decoration: InputDecoration(
            suffixIcon: 
                 InkWell(
                    onTap: () {
                      presenter.switchObscureTextStatus();                   
                    },
                    child: Icon(presenter.authModel.obscureTextStatus
                       ? Icons.remove_red_eye_outlined : Icons.abc,
                      size: 20,
                    ),
                  ),
               
            hintText: hintText,
            hintStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 50, 1, 185),
              ),
            ),
            isDense: true,
            labelStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      );
    });
  }
}
