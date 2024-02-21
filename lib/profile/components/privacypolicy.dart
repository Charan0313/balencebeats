import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyPrivacyPolicy extends StatelessWidget {
  const MyPrivacyPolicy({Key? key}) : super(key: key);

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
          'Privacy Policy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This Privacy Policy outlines how BalanceBeats ("we," "our," or "us") collects, uses, and protects your personal information. By using the BalanceBeats mobile application, you agree to the terms outlined in this policy.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Information We Collect'),
            const SizedBox(height: 10),
            _buildListItem(
              'Personal Information:',
              '- We may collect personal information such as name, contact details, and emergency contact information to provide our services effectively.',
            ),
            _buildListItem(
              'Health and Well-being Data:',
              '- To monitor sleep levels, heart health, and stress levels, the app may collect data from your connected smartwatch, including heart rate, sleep patterns, and other relevant metrics.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('How We Use Your Information'),
            const SizedBox(height: 10),
            _buildListItem(
              'Service Provision:',
              '- We use your personal information to provide the services offered by BalanceBeats, including personalized health insights and automated alerts.',
            ),
            _buildListItem(
              'Emergency Contacts:',
              '- Emergency contact information is used to notify designated contacts in case of high stress levels, as specified by the user.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Data Security'),
            const SizedBox(height: 10),
            _buildListItem(
              'Encryption:',
              '- Your data is encrypted to ensure its security during transmission and storage.',
            ),
            _buildListItem(
              'Access Control:',
              '- We implement access controls to restrict unauthorized access to your personal information.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Third-Party Services'),
            const SizedBox(height: 10),
            _buildListItem(
              'Smartwatch Integration:',
              '- The app may integrate with third-party smartwatches to collect health data. Please review the privacy policies of these providers.',
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
        fontSize: 16,
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
