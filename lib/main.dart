import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';
import 'package:insiit/loginScreen.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/weekly_menu/interface.dart';
import 'package:insiit/shuttle/shuttle.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await userSheetsAPI.init();
  await Firebase.initializeApp();

  addBusRoute("IITGN", "Visat", ["AB1", "Research Park", "Gate-2", "Kudasan"],
      "5:15 PM");
  addBusRoute("Visat", "IITGN", ["Kudasan", "Gate-2", "Sports Complex", "AB 1"],
      "6:00 PM");
  addBusRoute("IITGN", "Kudasan", ["AB1", "Chimair", "Gate-2"], "9:00PM");
  addBusRoute("Visat", "IITGN", ["Kudasan", "Gate-2", "Sports Complex", "AB 1"],
      "9:00 AM");
  addBusRoute("Kudasan", "IITGN", ["Gate-2"], "10:30 PM");
  addBusRoute("Visat", "IITGN",
      ["Kudasan", "Gate-2", "Sports\nComplex", "AB 1"], "7:30 AM");
  addBusRoute("IITGN", "Visat", ["AB1", "Research Park", "Gate-2", "Kudasan"],
      "6:45 PM");
  addBusRoute("IITGN", "Visat", ["AB1", "Research Park", "Gate-2", "Kudasan"],
      "8:15 AM");

  if (FirebaseAuth.instance.currentUser != null) {
    var currentUser = FirebaseAuth.instance.currentUser;
    user_name = (currentUser?.displayName)!;
    email_id = (currentUser?.email)!;
    profile_url = (currentUser?.photoURL)!;

    isGuest = false;
    runApp(homePage());
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => loginPage(),
        '/homePage': (context) => homePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
