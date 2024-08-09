import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
// instance of auth and firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   get current user
  User? getCurrentUser(){
    return _auth.currentUser;
  }

// sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      // sign user in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      // save user info if it doesn't already exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid' : userCredential.user!.uid,
            'email' : email
          }
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("\n\n"+e.toString() + "\n\n");
      throw Exception(e.code);
    }
  }

// sign up

  Future<UserCredential?> signUpWithEmailPassword(String email, password,name,mobile) async {
    try {
      // create user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // save user info if it doesn't already exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid' : userCredential.user!.uid,
            'email' : email,
            'name' : name,
            'mobile' : mobile,
          }
      );

      return userCredential;
    }  catch(e){
      log("\n\n" +e.toString()+"\n\n");
      return null;
      // throw Exception(e.toString());
    }
  }

// sign out

  Future<void> signOut() async {
    return await _auth.signOut();
  }

// errors

// sign in
}
