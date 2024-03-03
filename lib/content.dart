import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String text;
  final double size;

  const Content({
    required this.text,
    required this.size,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        // textAlign: align,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: size,
        ),
      ),
    );
  }
}