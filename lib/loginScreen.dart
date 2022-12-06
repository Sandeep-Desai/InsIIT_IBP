import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/weekly_menu/interface.dart';

void main() => runApp(loginPage());

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/homepage': (context) => homePage(),
          '/weeklyMenu': (context) => WeeklyMenuTemp()
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Myhome());
  }
}

class Myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InsIIT")),
      body: Column(
        children: [
          Image.asset('images/iitgn_logo.png'),
          ElevatedButton(
              onPressed: () {
                signWithGoogleId(context: context);
              },
              child: Column(
                  children: [Text("Login with Google"), Icon(Icons.login)])),
        ],
      ),
    );
  }
}
