import 'package:app_todo_lovepeople/modules/sign_up/sign_up_presenter.dart';
import 'package:app_todo_lovepeople/modules/sign_up/widgets/sign_up_password_text_field_widget.dart';
import 'package:app_todo_lovepeople/modules/sign_up/widgets/sign_up_text_form_field_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/text_button_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/dynamic-button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<SignUpPresenter>(builder: (context, presenter, child) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 169, 1, 247),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.23,
                ),
                Text(
                  'Vamos começar!',
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
                SignUpUserTextFormFieldWidget(
                  onChanged: presenter.setUsername,
                  hintText: 'Nome',
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SignUpUserTextFormFieldWidget(
                  onChanged: presenter.setNumberEmailCpf,
                  hintText: 'Número de telefone, email ou CPF',
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SignUpPasswordTextFormFieldWidget(
                  onChanged: presenter.setPassword,
                  status: presenter.signUpModel.obscurePasswordStatus,
                  toggleStatus: presenter.toggle,
                  hintText: 'Senha',
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SignUpPasswordTextFormFieldWidget(
                  onChanged: presenter.setConfirmPassword,
                  status: presenter.signUpModel.obscurePasswordConfirmStatus,
                  toggleStatus: presenter.toggle,
                  hintText: 'Confirmar senha',
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                DynamicButtonWidget(
                  onTap: () {
                    presenter.validateUsername(presenter.signUpModel.username);
                    print(presenter.signUpModel.isUsernameSignupValid);
                    // presenter.postData();
                  },
                  text: 'Cadastrar',
                  buttonColor: Color.fromARGB(255, 50, 1, 185),
                  width: size.width * 0.45,
                  radius: 15,
                ),
                SizedBox(
                  height: size.height * 0.12,
                ),
                TextButtonWidget(
                  route: '',
                  marginRight: 0,
                  text: 'Já possui cadastro? ',
                  buttonText: 'Entrar',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
