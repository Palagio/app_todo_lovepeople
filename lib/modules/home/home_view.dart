import 'package:app_todo_lovepeople/modules/home/home_page_controller.dart';
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
  final _controller = TextEditingController();
  late HomePageController controller;

  @override
  void initState() {
    context.read<HomePageController>().getTodos();
    setState(() {
      controller = context.read();
      controller.load();
    });

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
      body: Consumer<HomePageController>(builder: (_, controller, snapshot) {
        final todo = controller.listToShow.toList();
        return Column(
          children: [
            SearchWordsWidget(
                hintText: 'Procurar',
                size: size,
                controller: _controller,
                onChanged: controller.onChangeText),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: todo.length,
              itemBuilder: (context, index) {
                String cor = todo[index].color;
                int color = int.parse(cor);
                final corHex = color.toRadixString(16);
                return ContainerListWidget(
                    id: todo[index].id,
                    size: size,
                    title: todo[index].title,
                    description: todo[index].description,
                    color: HexColor.fromHex(corHex));
              },
            )),
          ],
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, '/add_new');
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
