import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // intance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

// sign in
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); // Corrected syntax
    }
  }


  // signup

  // sign out

  // error
}
