import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/search_words_widget.dart';
import 'package:app_todo_lovepeople/shared/widgets/delete_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
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
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 25),
                  child: SearchWordsWidget(
                    hintText: 'Buscar palavras-chave',
                    onChanged: presenter.onChangeText,
                  ),
                ),
                Container(
                  height: size.height * 0.5,
                  width: size.width * 0.8,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: presenter.listToShow.length,
                    itemBuilder: (context, index) {
                 
                      String color =
                          presenter.listToShow[index].color.toString();
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
                                      '${presenter.listToShow[index].title}',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 50, 1, 185),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (_) => DeleteDialogWidget(
                                          toDoTitle:
                                              presenter.toDoList[index].title,
                                          toDoId: presenter.toDoList[index].id),
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
                              Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                  top: size.height * 0.01,
                                ),
                                child: Text(
                                  presenter.listToShow[index].description
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 50, 1, 185),
                                    ),
                                  ),
                                ),
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
              Navigator.pushNamed(context, '/add_new');
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
