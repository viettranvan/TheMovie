import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_movie/models/models.dart';
import 'package:the_movie/widgets/widgets.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var idTokenResult = await userCredential.user?.getIdTokenResult();
      String uid = userCredential.user?.uid ?? '';
      String token = idTokenResult!.token ?? '';
      int expirationTime = idTokenResult.expirationTime!.millisecondsSinceEpoch;

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
      String uid = userCredential.user?.uid ?? '';
      String token = idTokenResult!.token ?? '';
      int expirationTime = idTokenResult.expirationTime!.millisecondsSinceEpoch;

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

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      showDialog(
          context: context,
          builder: (context) => const LoadingDialog());

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }
}
