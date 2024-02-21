import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  const TextBar({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
