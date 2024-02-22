import 'package:balencebeats/Emergencycontacts/components/contact_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:balencebeats/Emergencycontacts/contacts.dart';

class EmergengyContact extends StatefulWidget {
  const EmergengyContact({Key? key});

  @override
  State<EmergengyContact> createState() => _EmergengyContactState();
}

class _EmergengyContactState extends State<EmergengyContact> {
  
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
        centerTitle: true,
        title: const Text(
          'Emergency Contacts!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Get.height / 10),
                ...ContactManager.contacts
                    .map(
                      (contact) => ContactBlock(
                        contact: contact['name'] ?? '',
                        number: contact['number'] ?? '',
                        onDelete: () {
                          setState(() {
                            ContactManager.removeContact(contact);
                          });
                        },
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ContactManager.contacts.length < 5
          ? SizedBox(
              width: Get.width / 2,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 140, 164, 226),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String newName = '';
                      String newNumber = '';
                      return AlertDialog(
                        title: const Text('Add Contact'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onChanged: (value) {
                                newName = value;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter contact name',
                              ),
                            ),
                            TextField(
                              onChanged: (value) {
                                newNumber = value;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter your phone number',
                              ),
                            ),
                          ],
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
                              if (newName.isNotEmpty && newNumber.isNotEmpty) {
                                setState(() {
                                  ContactManager.addContact(
                                      {'name': newName, 'number': newNumber});
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
                child: const Text(
                  'Add contact',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
