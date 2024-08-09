import 'package:chat_app/components/my_textField.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  // final String Username;

  ChatScreen({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
    // required this.Username
  });

  // text controller
  final TextEditingController _messageController = TextEditingController();

  //  chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    // if there is something inside textfield
    if (_messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(receiverID, _messageController.text);

      //   clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //   display all message
          Expanded(
            child: _buildMessageList(),
          ),
          //   user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        //   error
        if (snapshot.hasError) {
          return const Text('Error');
        }
        //   loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading.....');
        }
        // return list view
        return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList());
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        data['senderEmail'] == _authService.getCurrentUser()!.uid;

    // align message to the right if sender is the current user, otherwise left

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    print("-----------------------$data------------------------------");
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            data["message"],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          //  textfield should take up most of the space
          Expanded(
            child: MyTextField(
              hintText: "Type a message",
              obscureText: false,
              controller: _messageController,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
