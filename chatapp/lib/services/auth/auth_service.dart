import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instance of Auth & Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user
  // Get the currently logged-in user (✅ NEW METHOD)
  User? getCurrentUser(){
    return _auth.currentUser;
  }

  // Sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Sign user in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user info if it doesn't already exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true)); // Prevents overwriting existing data

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user info in Firestore
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }



  // Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
