import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWordsWidget extends StatelessWidget {
  final String hintText;
  final dynamic onChanged;

  const SearchWordsWidget({
    Key? key,
    required this.hintText, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.9,
      child: TextFormField(
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
  }
}
