import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/loginScreen.dart';

void main() => runApp(homepage());

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepagestate();
}

class _homepagestate extends State<homepage> {
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
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
