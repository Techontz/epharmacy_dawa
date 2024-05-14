import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  final String name;

  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Message> messages = [
    Message(
      message: 'Hello, how are you?',
      isSentByMe: true,
      avatarImage: 'assets/images/Profile Image.png',
    ),
    Message(
      message: 'I am good. How about you?',
      isSentByMe: false,
      avatarImage: 'assets/images/Profile Image.png',
    ),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is pressed
          },
        ),
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.3),
                Colors.white.withOpacity(0.3),
                Colors.indigo.withOpacity(0.3),
              ],
            ),
          ),
        ),
        leadingWidth: 40.0, // Adjust the width of the leading widget if needed
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0), // Adjust the padding as needed
            child: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                _launchPhoneDialer(); // Call the method to launch the phone dialer
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true, // Scroll to bottom initially
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Adjust padding here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: messages.map((message) {
                  return MessageBubble(
                    message: message.message,
                    isSentByMe: message.isSentByMe,
                    avatarImage: message.avatarImage,
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _sendMessage(); // Send message when button is pressed
                  },
                  child: Text('Send',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 136, 102),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String text = _textController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(message: text, isSentByMe: true, avatarImage: 'assets/images/Profile Image.png'));
        _textController.clear();
      });
    }
  }

  void _launchPhoneDialer() async {
    const phoneNumber = 'tel:0614100097'; // Replace this with your phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}

class Message {
  final String message;
  final bool isSentByMe;
  final String avatarImage;

  Message({
    required this.message,
    required this.isSentByMe,
    required this.avatarImage,
  });
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String avatarImage;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isSentByMe,
    required this.avatarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSentByMe) ...[
          CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
            radius: 20,
          ),
          SizedBox(width: 8.0), // Adjust spacing as needed
        ],
        Expanded(
          child: Align(
            alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isSentByMe ? Color.fromARGB(255, 0, 136, 102) : Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isSentByMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        if (isSentByMe) ...[
          SizedBox(width: 8.0), // Adjust spacing as needed
          CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
            radius: 20,
          ),
        ],
      ],
    );
  }
}
