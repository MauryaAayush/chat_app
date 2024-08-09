import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
   ChatScreen({super.key, required this.receiverEmail, required this.receiverID});

   // text controller
   final TextEditingController _messageController = TextEditingController();

  //  chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  // send message
  void sendMessage() async {
    // if there is something inside textfield
    if(_messageController.text.isNotEmpty){
    // send the message
      await  _chatService.sendMessage(receiverID, _messageController.text);

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
    );
  }
}
