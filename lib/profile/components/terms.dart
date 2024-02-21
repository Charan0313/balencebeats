import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyTerms extends StatelessWidget {
  const MyTerms({Key? key}) : super(key: key);

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
        title: const Text(
          'Terms of Service',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Acceptable Use'),
            const SizedBox(height: 10),
            _buildListItem(
              'User Responsibilities:',
              'Users are responsible for maintaining the confidentiality of their account information and ensuring the accuracy of the provided data.',
            ),
            _buildListItem(
              'Compliance:',
              'Users must comply with all applicable laws and regulations while using the BalanceBeats app.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Limitation of Liability'),
            const SizedBox(height: 10),
            _buildListItem(
              'Disclaimer:',
              'We are not liable for any damages or losses resulting from the use of the app, including but not limited to health-related decisions based on the provided insights.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Modifications to Terms'),
            const SizedBox(height: 10),
            _buildListItem(
              'Updates:',
              'We reserve the right to update these terms at any time. Users will be notified of changes, and continued use of the app constitutes acceptance of the modified terms.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildListItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(content),
      ],
    );
  }
}
