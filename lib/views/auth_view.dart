import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/password_text_field_widget.dart';
import 'widgets/text_form_field_widget.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 1,
                    decoration: const BoxDecoration(
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
                    child: SizedBox(
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
                        textStyle: const TextStyle(
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
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const TextFormFieldWidget(
                hintText: 'Número de telefone, email ou CPF',
              ),
              const PasswordFormFieldWidget(hintText: 'Senha'),
            ],
          ),
        ),
      ),
    );
  }
}
