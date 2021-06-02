import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  final FirebaseAuth _firebaseAuth;

  AuthenticateService(this._firebaseAuth); //dependecies injection

  //Stream check AuthState
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  /*
  * SIGN IN WITH EMAIL 
  */
  Future<String> signInWithEmail({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Da Dang nhap";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      } else {
        return "Something Went Wrong.";
      }
    }
  }

  /*
   * SIGN UP 
   */
  Future<void> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /*
   * LOGOUT
   */
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
