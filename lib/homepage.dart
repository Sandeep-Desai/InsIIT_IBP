import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/loginScreen.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/shuttle/shuttle.dart';
import 'package:insiit/weekly_menu/interface.dart';
import 'package:insiit/shuttle/shuttle.dart';

void main() => runApp(homePage());

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("InsIIT"),
          ),
          body: Column(
            children: [
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
                  child: Text("Weekly Mess Menu")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => shuttlePage()));
                  },
                  child: Text("Shuttle"))
            ],
          ),
        );
      }),
    );
  }
}
