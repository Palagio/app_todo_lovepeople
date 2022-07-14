import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    required String title,
    double elevation = 0,
    required double width,
    required double height,
    required double padding,
  }) : super(
          key: key,
          backgroundColor: const Color.fromARGB(255, 169, 1, 247),
          centerTitle: true,
          toolbarHeight: height,
          leadingWidth: width,
          elevation: elevation,
          title: Padding(
            padding: EdgeInsets.only(left: padding, top: 30),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          leading: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/shared/logo.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                )),
          ),
        );
}
