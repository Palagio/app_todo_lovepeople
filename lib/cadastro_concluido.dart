import 'package:app_todo_lovepeople/shared/widgets/dynamic-button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroConcluido extends StatefulWidget {
  CadastroConcluido({Key? key}) : super(key: key);

  @override
  State<CadastroConcluido> createState() => _CadastroConcluidoState();
}

class _CadastroConcluidoState extends State<CadastroConcluido> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.25),
              child: Center(
                child: Text(
                  'Cadastro Concluído!',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.18),
              child: DynamicButtonWidget(
                  text: 'Começar',
                  buttonColor: Color.fromARGB(255, 50, 1, 185),
                  width: size.width * 0.42,
                  radius: 20,
                  onTap: () => Navigator.pushNamed(context, '/auth_view')),
            ),
            Container(
              height: size.height * 0.3,
              width: size.width * 1,
              child: Flexible(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 1,
                      left: 1,
                      right: 1,
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 1,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(180),
                            topRight: Radius.circular(180),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1000,
                      width: 1000,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Image.asset(
                          'assets/images/shared/coruja-image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.02,
                      right: 20,
                      left: 20,
                      child: Text(
                        'Os ventos da programação estão indo até você',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 50, 1, 185),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
