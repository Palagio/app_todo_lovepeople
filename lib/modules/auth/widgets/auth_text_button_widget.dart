import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextButtonWidget extends StatelessWidget {
  final String text;
  final String buttonText;

  const AuthTextButtonWidget({
    Key? key,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin:
          EdgeInsets.only(left: size.width * 0.055, top: size.height * 0.013),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: Text(
              buttonText,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 213, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
