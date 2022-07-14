import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTaskFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscure;

  const NewTaskFormFieldWidget(
      {Key? key, required this.hintText, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.9,
      width: size.width * 0.9,
      child: TextFormField(
        maxLines: 20,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 50, 1, 185),
            ),
          ),
          isDense: true,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
