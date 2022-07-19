import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpUserTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  SignUpUserTextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

   
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
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
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
  
  }
}
