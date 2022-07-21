// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:app_todo_lovepeople/modules/auth/auth_presenter.dart';
import 'package:provider/provider.dart';

class WaitingView extends StatefulWidget {
  WaitingView({Key? key}) : super(key: key);

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
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
    (context.read<AuthPresenter>().authModel.isUserLogged)
        ? Navigator.pushReplacementNamed(context, '/home')
        : Navigator.pushReplacementNamed(context, '/auth_view');
  }
}
