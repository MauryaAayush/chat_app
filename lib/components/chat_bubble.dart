
import 'package:chat_app/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {

  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {

    bool isDark = Provider.of<ThemeProvider>(context,listen : false).isdark;

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      
      decoration: BoxDecoration(
         color: isCurrentUser
             ? (isDark ? Colors.green.shade600 : Colors.green.shade500)
             : (isDark ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(
          message,
        style: TextStyle(
          color: isCurrentUser
              ? Colors.white
              : (isDark ? Colors.white : Colors.black)
        ),
      ),
    );
  }
}
