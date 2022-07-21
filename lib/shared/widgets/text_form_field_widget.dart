import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final dynamic onChanged;

  UserTextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AuthPresenter>(builder: (context, presenter, child) {
      return Container(
        height: size.height * 0.06,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          onChanged: onChanged,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 50, 1, 185),
              fontWeight: FontWeight.w500,
            ),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.white),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 50, 1, 185),
                fontWeight: FontWeight.w500,
              ),
            ),
            contentPadding: EdgeInsets.all(size.width * 0.04),
          ),
        ),
      );
    });
  }
}
