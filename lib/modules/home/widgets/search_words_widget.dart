import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchWordsWidget extends StatelessWidget {
  final String hintText;
  final dynamic onChanged;

  const SearchWordsWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HomePresenter>(builder: (context, presenter, child) {
      return SizedBox(
        height: size.height * 0.1,
        width: size.width * 0.9,
        child: TextFormField(
          onTap: () {
            showSearch(context: context, delegate: MySearchDelegate());
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 20,
              ),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 50, 1, 185),
              ),
            ),
            isDense: true,
            labelStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      );
    });
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    dynamic listToShow = context.read<HomePresenter>().listToShow;
    ListView.builder(
        itemCount: listToShow.toString().length,
        itemBuilder: (context, index) {
          final suggestions = listToShow[index];
          return ListTile(
            title: Text(suggestions),
            onTap: (){
              
            },
          );
        });

    throw UnimplementedError();
  }
}
