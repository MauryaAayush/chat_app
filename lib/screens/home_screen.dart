import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../components/my_drawer.dart';

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
          if(snapshot.hasData){
            return const Text('Error');
          }
        //   loading....
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading...');
          }
        //   return list view
        return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem)
                .toList());
      },
    );
  }


//   build individual list tile for the user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context){
  //   display all the user  except  current user
    return UserTile();

  }
}
