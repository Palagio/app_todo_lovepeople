import 'dart:html';

import 'package:flutter/material.dart';

class CadastroConcluido extends StatefulWidget {
  CadastroConcluido({Key? key}) : super(key: key);

  @override
  State<CadastroConcluido> createState() => _CadastroConcluidoState();
}

class _CadastroConcluidoState extends State<CadastroConcluido> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 169, 1, 247),
        body: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Center(
                    child: Text(
                      'Cadastro Concluído!',
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 700,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180),
                      bottomRight: Radius.circular(180),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
