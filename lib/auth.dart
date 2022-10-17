import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insiit/homepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(hostedDomain: 'iitgn.ac.in');

Future<void> signWithGoogleId({required BuildContext context}) async {
  await Firebase.initializeApp();
  final GoogleSignInAccount? googleId = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleIdAuth =
      await googleId!.authentication;
  final AuthCredential cred = GoogleAuthProvider.credential(
      accessToken: googleIdAuth.accessToken, idToken: googleIdAuth.idToken);
  final UserCredential authResult = await _auth.signInWithCredential(cred);
  final User? user = authResult.user;
  Navigator.pushNamed(
    context,
    '/homepage',
  );
}

Future<void> signOut() async {
  await googleSignIn.signOut();
}
