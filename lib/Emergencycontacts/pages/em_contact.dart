import 'package:balencebeats/Emergencycontacts/components/contact_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergengyContact extends StatefulWidget {
  const EmergengyContact({super.key});

  @override
  State<EmergengyContact> createState() => _EmergengyContactState();
}

class _EmergengyContactState extends State<EmergengyContact> {
  List<String> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                const Text('Emergency Contact',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: Get.height / 10),
                ...contacts
                    .map((contact) => ContactBlock(
                          contact: contact,
                          onDelete: () {
                            setState(() {
                              contacts.remove(contact);
                            });
                          },
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: contacts.length < 5
          ? SizedBox(
            width: Get.width/2,
            child: FloatingActionButton(
              elevation: 0,
                backgroundColor: Color.fromARGB(255, 140, 164, 226),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String newContact = '';
                      return AlertDialog(
                        title: const Text('Add Contact'),
                        content: TextField(
                          onChanged: (value) {
                            newContact = value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter contact name'),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (newContact.isNotEmpty) {
                                setState(() {
                                  contacts.add(newContact);
                                });
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Add contact',style: TextStyle(color: Colors.white),),
              ),
          )
          : null,
           floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
