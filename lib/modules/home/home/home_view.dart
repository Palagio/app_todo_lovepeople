import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_view.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/search_words_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/delete_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomePresenter>().homeRepository.toDoList = [];
    context.read<HomePresenter>().getToDos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      appBar: AppBarWidget(
        title: 'Suas Listagens',
        height: size.height * 0.15,
        width: size.width * 0.25,
        padding: size.width * 0.05,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<HomePresenter>(builder: (context, presenter, child) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 25),
                  child: SearchWordsWidget(
                    hintText: 'Busque palavras-chave',
                  ),
                ),
                Container(
                  height: size.height * 0.5,
                  width: size.width * 0.8,
                  child: ListView.builder(
                    itemCount: presenter.homeRepository.toDoList.length,
                    itemBuilder: (context, index) {
                      String color = presenter
                          .homeRepository.toDoList[index].color
                          .toString();
                      dynamic colorDecoded =
                          int.parse(color.substring(1, 7), radix: 16) +
                              0xFF000000;
                      return SizedBox(
                        height: size.height * 0.12,
                        child: Card(
                          color: Color(colorDecoded),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.01,
                                    ),
                                    child: Text(
                                        '${presenter.homeRepository.toDoList[index].title}'),
                                  ),
                                  InkWell(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (_) => DeleteDialogWidget(
                                          toDoTitle: presenter.homeRepository
                                              .toDoList[index].title,
                                          toDoId: presenter.homeRepository
                                              .toDoList[index].id),
                                    ),
                                    child: Container(
                                      height: size.height * 0.04,
                                      padding: EdgeInsets.only(
                                          right: size.width * 0.03,
                                          top: size.height * 0.01),
                                      child: Image.asset(
                                        'assets/images/shared/trash.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, '/add_new');
            },
            child: Image.asset(
              'assets/images/shared/plus.png',
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
