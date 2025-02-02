import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatService {
  //  --->> flutter pub add cloude_firestore

  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){

        // go through each individual user
        final user = doc.data();

        // returne user
        return user;
      }).toList();
    });
  }


  // send message

  // get message
}
