import 'package:flutter/material.dart';

class MyFloatButton extends StatefulWidget {
  const MyFloatButton({super.key});

  @override
  State<MyFloatButton> createState() => _MyFloatButtonState();
}

class _MyFloatButtonState extends State<MyFloatButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: ()=>{});
  }
}
