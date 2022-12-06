import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';
import 'package:insiit/loginScreen.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/weekly_menu/interface.dart';

Future main() async {
  print("before init");
  WidgetsFlutterBinding.ensureInitialized();
  print("after widget");
  await userSheetsAPI.init();
  await Firebase.initializeApp();
  print("after init");
  // print(isLoggedIn());
  print(isLoggedIn);
  print(FirebaseAuth.instance.currentUser);
  if (FirebaseAuth.instance.currentUser != null) {
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
