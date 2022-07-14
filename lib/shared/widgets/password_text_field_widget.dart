import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordTextFormFieldWidget extends StatelessWidget {
  final String hintText;

  PasswordTextFormFieldWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AuthPresenter>(builder: (context, presenter, child) {
      return Container(
        height: size.height * 0.07,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 50, 1, 185),
              fontWeight: FontWeight.w500,
            ),
          ),
          expands: false,
          obscureText: presenter.authModel.obscureTextStatus,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: InkWell(
              onTap: () {
                presenter.switchObscureTextStatus();
              },
              child: Container(
                height: size.height * 0.07,
                padding: EdgeInsets.all(size.width * 0.03),
                child: Image.asset(
                  presenter.authModel.obscureTextStatus
                      ? 'assets/images/authImages/auth-password-eye.png'
                      : 'assets/images/authImages/auth-password-eye-sharp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 16,
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
