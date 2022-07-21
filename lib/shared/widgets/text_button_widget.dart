import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final String buttonText;

  final double marginRight;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.marginRight,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: marginRight, top: size.height * 0.013),
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/sign_up_view'),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
