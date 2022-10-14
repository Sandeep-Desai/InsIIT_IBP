import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => loginPageState();
}

class loginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {'/homepage': (context) => homepage()}, home: Myhome());
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
                signWithGoogleId();
                Navigator.pushNamed(context, '/homepage');
              },
              child: Text("Login with Google"))
        ],
      ),
    );
  }
}
