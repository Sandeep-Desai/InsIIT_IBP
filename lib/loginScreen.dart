import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/weekly_menu/interface.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(loginPage());

String loginPageBG = "https://iitgn.ac.in/assets/img/home-vertical-joinus.jpg";

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
      // appBar: AppBar(
      //   title: Text("InsIIT"),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(loginPageBG),
          fit: BoxFit.fitHeight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("InsIIT - All things IIGN"),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    signWithGoogleId(context: context);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black54,
                          // size: 25,
                        ),
                        Text(
                          " Login with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
