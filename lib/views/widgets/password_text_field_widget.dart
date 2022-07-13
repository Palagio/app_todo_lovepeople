import 'package:app_todo_lovepeople/presenters/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordFormFieldWidget extends StatefulWidget {
  final String hintText;


  PasswordFormFieldWidget({
    Key? key,
    required this.hintText,

  }) : super(key: key);

  @override
  State<PasswordFormFieldWidget> createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  late AuthPresenter presenter;

  @override
  void initState() {
    presenter.authModel.obscureText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool store = false;

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.9,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: presenter.authModel.obscureText
              ? Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20,
                )
              : Icon(
                  Icons.remove_red_eye_rounded,
                  size: 20,
                ),
          hintText: widget.hintText,
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
  }
}
