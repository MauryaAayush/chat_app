import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService{

// get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// get user stream

/*
  List<Map<String,dynamic>> =
  [
  {
  'email : admin@gmail.com',
  'id' : ....
  },
   {
  'email : aayush@gmail.com',
  'id' : ....
  },
  ]
 */


  Future<Stream<List<Map<String, dynamic>>>> getUserStream() async {

  }

// send message

// get message


}