import 'package:flutter/material.dart';

class Econtact extends StatefulWidget {
  const Econtact({super.key});

  @override
  State<Econtact> createState() => _EcontactState();
}

class _EcontactState extends State<Econtact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: const Column(
          children: [
            Text(
              'EMERGENCY CONTACTS'
            ),

          ],
        ),
      ),
    );
  }
}
