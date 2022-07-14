import 'package:app_todo_lovepeople/modules/auth/widgets/auth_text_button_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/dynamic-button_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/password_text_field_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 1, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(180),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.05,
                    left: size.width * 0.32,
                    right: size.width * 0.32,
                    child: Container(
                      height: size.height * 0.2,
                      child: Image.asset(
                        'assets/images/shared/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.24,
                    left: size.width * 0.395,
                    child: Text(
                      'Lovepeople',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Que bom que voltou!',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              UserTextFormFieldWidget(
                hintText: 'Número de telefone, email ou CPF',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              PasswordTextFormFieldWidget(
                hintText: 'Senha',
              ),
              AuthTextButtonWidget(
                buttonText: 'Clique aqui',
                text: 'Esqueceu seu login ou senha? ',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              DynamicButtonWidget(
                text: 'Entrar',
                buttonColor: Color.fromARGB(255, 50, 1, 185),
                width: size.width * 0.3,
                radius: 15,
              ),
              SizedBox(height: size.height * 0.07),
              AuthTextButtonWidget(
                text: 'Não possui cadastro? ',
                buttonText: 'Clique aqui',
              )
            ],
          ),
        ),
      ),
    );
  }
}
