import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/loginScreen.dart';
import 'package:insiit/weekly_menu/interface.dart';

void main() => runApp(homePage());

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("InsIIT"),
        ),
        body: Column(
          children: [
            Text("Welcome to InsIIT"),
            ElevatedButton(
                onPressed: () {
                  signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: Text("Sign Out")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeeklyMenuTemp()));
                },
                child: Text("Weekly Mess Menu"))
          ],
        ),
      ),
    );
  }
}
