import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

// build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //   error
        if (snapshot.hasError) {
          return const Text('Error');
        }
        //   loading....
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        //   return list view
        return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem(userData,context))
                .toList());
      },
    );
  }

//   build individual list tile for the user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //   display all the user  except  current user
    if(userData['email'] != _authService.getCurrentUser()?.email){
      return UserTile(
        // textnum: userData['mobile'],
        text: userData["email"],
        onTap: () {
          //   tapped on a user -> to go to chat
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  // Username: userData["name"],
                  receiverID: userData["uid"],
                  receiverEmail: userData["email"],
                ),
              ));
        },
      );
    }else{
      return Container();
    }
  }
}
