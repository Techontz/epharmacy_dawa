import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Screens/pharmacist/chat/components/ChatScreen.dart' as ChatScreenAlias; // Alias the import

class Chats extends StatelessWidget {
  final List<ChatItem> chatList = [
    ChatItem(
      name: 'Conrad Bubex',
      message: 'Hey there! How are you?',
      time: '10:30 AM',
      profileImage: 'assets/images/Profile Image.png',
      messageCount: 2,
    ),
    ChatItem(
      name: 'Jane Smith',
      message: 'Let\'s meet tomorrow.',
      time: 'Yesterday',
      profileImage: 'assets/images/Profile Image.png',
      messageCount: 0,
    ),
    ChatItem(
      name: 'Conrad Bubex',
      message: 'Hey there! How are you?',
      time: '10:30 AM',
      profileImage: 'assets/images/Profile Image.png',
      messageCount: 2,
    ),
    ChatItem(
      name: 'Jane Smith',
      message: 'Let\'s meet tomorrow.',
      time: 'Yesterday',
      profileImage: 'assets/images/Profile Image.png',
      messageCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Chats",
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
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat.profileImage),
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(chat.time),
                SizedBox(width: 8),
                if (chat.messageCount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 136, 102),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${chat.messageCount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Navigate to ChatScreen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreenAlias.ChatScreen(name: chat.name), // Use the alias
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String profileImage;
  final int messageCount;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.profileImage,
    required this.messageCount,
  });
}
