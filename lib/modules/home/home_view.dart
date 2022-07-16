import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_controller.dart';
import 'package:app_todo_lovepeople/modules/home/new_task/new_task_model.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/container_list_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/search_words_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<AddNewTaskController>().getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _search = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      appBar: AppBarWidget(
        title: 'Suas Listagens',
        height: size.height * 0.15,
        width: size.width * 0.25,
        padding: size.width * 0.05,
      ),
      body: Column(
        children: [
          SearchWordsWidget(
            hintText: 'Busque palavras-chave',
            size: size,
            controller: _search,
            onChange: searchTodo,
          ),
          Expanded(
            child: Consumer<AddNewTaskController>(
              builder: (_, controller, snapshot) {
                return ListView.builder(
                    itemCount: controller.listTodos.length,
                    itemBuilder: (context, index) {
                      String cor = controller.listTodos[index].color;
                      int color = int.parse(cor);
                      final corHex = color.toRadixString(16);
                      return ContainerListWidget(
                          size: size,
                          title: controller.listTodos[index].title.toString(),
                          description: controller.listTodos[index].description
                              .toString(),
                          color: HexColor.fromHex(corHex));
                          
                    });
                    
              },
            ),
          ),
        ],
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

  

  void searchTodo(String value) {
  }
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
