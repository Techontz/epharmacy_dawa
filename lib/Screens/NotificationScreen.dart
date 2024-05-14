import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 5, // Example number of notifications
        itemBuilder: (context, index) {
          return NotificationCard(
            title: 'Notification Title ${index + 1}',
            message: 'This is notification message ${index + 1}',
            time: '2 hours ago', // Example time
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(message),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
