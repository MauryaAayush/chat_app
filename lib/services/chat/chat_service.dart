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


  Stream<List<Map<String,dynamic>>> getUserStream(){

  }

// send message

// get message


}