import 'package:app_todo_lovepeople/modules/home/new_task/add_new_task_controller.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/app_bar_widget.dart';
import 'package:app_todo_lovepeople/modules/home/widgets/search_words_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = TextEditingController();

  String? searchText;

  @override
  void initState() {
    
    context.read<AddNewTaskController>().getTodos();
    _controller.addListener(
      () {
        setState(() {
          searchText = _controller.text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      body: Column(
        children: [
          SearchWordsWidget(
            hintText: 'Procurar',
            size: size,
            controller: _controller,
            onChanged: (value) {
              Provider.of<AddNewTaskController>(context, listen: false)
                  .changeSearchString(value);
            },
          ),
          Expanded(
            child: Consumer<AddNewTaskController>(
                builder: (_, controller, snapshot) {
              final todo = controller.listTodos.toList();
              final filtro = todo;
              if (filtro.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filtro.length,
                  itemBuilder: (context, index) {
                    String cor = filtro[index].color;
                    int color = int.parse(cor);
                    final corHex = color.toRadixString(16);
                    return Card(
                        child: ListTile(
                          title: Text(filtro[index].title),
                          subtitle: Text(filtro[index].description),
                        ),
                        color: HexColor.fromHex(corHex));
                  },
                );
              } else {
                return Text('Sem resultados');
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, '/add_new');
              setState(() {});
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

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
