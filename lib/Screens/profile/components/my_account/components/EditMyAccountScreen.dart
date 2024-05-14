import 'package:flutter/material.dart';

class EditMyAccountScreen extends StatefulWidget {
  final String defaultName;
  final String defaultEmail;
  final String defaultPhone;

  const EditMyAccountScreen({
    Key? key,
    required this.defaultName,
    required this.defaultEmail,
    required this.defaultPhone,
  }) : super(key: key);

  @override
  _EditMyAccountScreenState createState() => _EditMyAccountScreenState();
}

class _EditMyAccountScreenState extends State<EditMyAccountScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.defaultName);
    _emailController = TextEditingController(text: widget.defaultEmail);
    _phoneController = TextEditingController(text: widget.defaultPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the edited profile information
                _saveProfileInfo();
                // Navigate back to the profile screen
                Navigator.pop(context);
              },
              child: Text('Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 136, 102),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfileInfo() {
    // Add functionality to save the edited profile information
    String newName = _nameController.text.trim();
    String newEmail = _emailController.text.trim();
    String newPhone = _phoneController.text.trim();
    // Implement logic to save the edited information (e.g., update database)
  }
}
