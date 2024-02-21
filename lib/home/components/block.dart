import 'package:flutter/material.dart';

class MySmallBlock extends StatefulWidget {
  final String imagePath;
  final String text;
  final Color backgroundColor;
  final void Function() onTap;

  const MySmallBlock({
    required this.imagePath,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  _MySmallBlockState createState() => _MySmallBlockState();
}

class _MySmallBlockState extends State<MySmallBlock> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped = true;
        });
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (isTapped)
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.imagePath),
            SizedBox(height: 5),
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}