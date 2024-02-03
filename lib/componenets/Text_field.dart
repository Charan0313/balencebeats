import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hinttext,
    required this.unknowntext,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hinttext;
  final bool unknowntext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: unknowntext,
        style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 46, 46, 47), 
        hintText: hinttext,
        hintStyle: TextStyle(color: Color.fromARGB(255, 109, 107, 109), fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17.0), 
          borderSide: const BorderSide(color: Colors.grey), 
          //  borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: const BorderSide(color: Colors.grey),
          //  borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
// 2C2C2E