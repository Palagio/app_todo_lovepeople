import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerListWidget extends StatefulWidget {
  final Size size;
  final Color color;
  final String title;
  final String description;

  const ContainerListWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  State<ContainerListWidget> createState() => _ContainerListWidgetState();
}

class _ContainerListWidgetState extends State<ContainerListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: widget.size.width * 0.9,
        height: widget.size.height * 0.2,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: const Color(0xFF3101B9),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'assets/images/shared/trash.png',
                        color: const Color(0xFF3101B9),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: const Color(0xFF3101B9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
