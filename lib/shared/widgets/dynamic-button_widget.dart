import 'package:app_todo_lovepeople/modules/auth/auth_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:app_todo_lovepeople/modules/sign_up/sign_up_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicButtonWidget extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final double width;
  final double radius;
  final dynamic onTap;

  const DynamicButtonWidget({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.width,
    required this.radius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return InkWell(
      onTap: onTap,
      child: Container(
              height: size.height * 0.06,
              width: width,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: Colors.white, width: 1.8),
              ),
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
