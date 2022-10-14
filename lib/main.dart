import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insiit/loginScreen.dart';

void main() => runApp(LoginPage());

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage('InsIIT'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
    );
  }
}
