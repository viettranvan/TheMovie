import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_movie/models/models.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var idTokenResult = await userCredential.user?.getIdTokenResult();
      var uid = userCredential.user?.uid;
      var token = idTokenResult?.token;
      var expirationTime = idTokenResult?.expirationTime;

      return Authentication(
          uid: uid, token: token, expiredToken: expirationTime);
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (e) {
      print('error: $e');
    }
  }

  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      var idTokenResult = await userCredential.user?.getIdTokenResult();
      var uid = userCredential.user?.uid;
      var token = idTokenResult?.token;
      var expirationTime = idTokenResult?.expirationTime;

      return Authentication(
          uid: uid, token: token, expiredToken: expirationTime);
    } on FirebaseAuthException catch (e) {
      print('code: ${e.code}');

      return e;
    } catch (e) {
      print('error: $e');
    }
  }

  Future signOut() async =>  _auth.signOut();

  Future sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (e) {
      print('error: $e');
    }
  }
}
