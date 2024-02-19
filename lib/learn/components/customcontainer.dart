import 'package:flutter/material.dart';

class CustomComponent extends StatefulWidget {
  final String firstText;
  final ImageProvider image;
  final String secondText;

  const CustomComponent({
    required this.firstText,
    required this.image,
    required this.secondText,
  });

  @override
  State<CustomComponent> createState() => _CustomComponentState();
}

class _CustomComponentState extends State<CustomComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color.fromARGB(255, 165, 154, 243),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.firstText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 200,
                child: Image(image: widget.image, fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.secondText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
