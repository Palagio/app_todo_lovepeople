import 'package:app_todo_lovepeople/modules/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPasswordTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final SignUpBoolValue status;
  final Function(String)? onChanged;
  final Function(SignUpBoolValue) toggleStatus;
  SignUpPasswordTextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.status,
    required this.toggleStatus,
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
        expands: false,
        obscureText: status.value,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: InkWell(
            onTap: () {
              toggleStatus(status);
            },
            child: Container(
              height: size.height * 0.07,
              padding: EdgeInsets.all(size.width * 0.03),
              child: Image.asset(
                status.value
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
  }
}
