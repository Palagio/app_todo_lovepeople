import 'package:flutter/material.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    funcao();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  funcao() async {
    await context.read<AuthPresenter>().tokenVerify();
    (context.read<AuthPresenter>().isUserLogged)
        ? Navigator.pushReplacementNamed(context, '/home')
        : Navigator.pushReplacementNamed(context, '/auth_view');
  }
}
