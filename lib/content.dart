import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String text;
  final double size;
  // final TextAlign align;

  const Content({
    required this.text,
    required this.size,
    // this.align = TextAlign.left,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        // textAlign: align,
        style: TextStyle(
          color: Colors.black,
          fontSize: size,
        ),
      ),
    );
  }
}