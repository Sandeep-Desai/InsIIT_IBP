import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:insiit/loginScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:insiit/homepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(hostedDomain: 'iitgn.ac.in');

//////
String user_name = "";
String roll_no = "";
String program = "";
String discipline = "";
String hostel_name = "";
int room_no = 0;
String mess_name = "";
String email_id = "";
String profile_url = "";
//////

bool isLoggedIn = false;
User? user = null;

Future<void> signWithGoogleId({required BuildContext context}) async {
  final GoogleSignInAccount? googleId = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleIdAuth =
      await googleId!.authentication;
  final AuthCredential cred = GoogleAuthProvider.credential(
      accessToken: googleIdAuth.accessToken, idToken: googleIdAuth.idToken);
  final UserCredential authResult = await _auth.signInWithCredential(cred);
  user = authResult.user;
  if (user != null) {
    isLoggedIn = true;
    var currentUser = FirebaseAuth.instance.currentUser;
    user_name = (currentUser?.displayName)!;
    email_id = (currentUser?.email)!;
    profile_url = (currentUser?.photoURL)!;

    isGuest = false;
  }
  Navigator.pushNamed(
    context,
    '/homepage',
  );
}

Future<void> signOut() async {
  isLoggedIn = false;
  user_name = "";
  email_id = "";
  profile_url = "";

  await googleSignIn.signOut();
}

void guestLogin({required BuildContext context}) {
  Navigator.pushNamed(
    context,
    '/homepage',
  );
  user_name = "Guest";
  email_id = "-";
  hostel_name = "";
  room_no = 0;
  roll_no = "-";
  mess_name = "-";
  discipline = "-";
  program = "";
  profile_url =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/14bb33f0-869c-4ad7-97fd-7be2f3fe9b51/dbtoqty-42fc1996-638c-4586-b079-821a9e6ba255.jpg/v1/fill/w_1024,h_1139,q_75,strp/daredevil_profile_picture_by_lumoi_dbtoqty-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTEzOSIsInBhdGgiOiJcL2ZcLzE0YmIzM2YwLTg2OWMtNGFkNy05N2ZkLTdiZTJmM2ZlOWI1MVwvZGJ0b3F0eS00MmZjMTk5Ni02MzhjLTQ1ODYtYjA3OS04MjFhOWU2YmEyNTUuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.1b0AQNfKZLZKesCWXK4hiuk_sY6axEgFDPiRnDiBy0c";
}
// bool isLoggedIn() {
//   print(googleSignIn.currentUser);
//   if (googleSignIn.currentUser != null) {
//     return true;
//   } else {
//     return false;
//   }
// }
