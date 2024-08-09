import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
// get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            //  go through each individual user
            final user = doc.data();

            //   return user
            return user;
          },
        ).toList();
      },
    );
  }

// send message

  Future<void> sendMessage(String receiverID, message) async {
    // get current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //   create a new message
    Message newMessage = Message(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    //  construct a chat room ID  for the two user
    List<String> ids = [currentUserId, receiverID];
    // sort the ids (this ensure that chatroomID is the same for any 2 people )
    ids.sort();
    String chatRoomID = ids.join();

    // add new msg to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("message")
        .add(newMessage.toMap());
  }

// get message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
// construct a chatroom ID for the two user

    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
