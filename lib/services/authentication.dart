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
      return e.message;
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
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
