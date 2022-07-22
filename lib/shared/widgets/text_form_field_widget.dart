import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';

class UserTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final dynamic onChanged;
  final FormFieldValidator<String>? validator;

  UserTextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
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
          controller: controller,
          validator: validator,
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
