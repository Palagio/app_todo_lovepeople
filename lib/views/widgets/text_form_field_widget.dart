import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscure;
  TextFormFieldWidget({Key? key, required this.hintText, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.9,
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
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
  }
}
