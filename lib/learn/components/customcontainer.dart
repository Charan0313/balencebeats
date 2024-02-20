import 'package:flutter/material.dart';

class CustomComponent extends StatelessWidget {
  final String firstText;
  final ImageProvider image;
  final String secondText;
  final VoidCallback onTap;

  const CustomComponent({
    required this.firstText,
    required this.image,
    required this.secondText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 165, 154, 243),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      firstText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: image,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                secondText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
