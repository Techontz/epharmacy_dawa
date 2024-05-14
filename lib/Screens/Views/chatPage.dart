import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  void _addMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  Future<void> _openWhatsAppChat() async {
    const phoneNumber = '+255769190100';
    final url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Contact Us",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 60,
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/doctor1.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: Text(_messages[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: _messageController,
                    placeholder: 'Type your message...',
                  ),
                ),
                CupertinoButton(
                  child: Icon(CupertinoIcons.arrow_up_circle),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      _addMessage(_messageController.text);
                      _messageController.clear();
                    }
                  },
                ),
                GestureDetector(
                  onTap: _openWhatsAppChat,
                  child: Image.asset(
                    'images/whatsapp.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
