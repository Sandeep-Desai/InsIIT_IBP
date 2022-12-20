import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insiit/auth.dart';
import 'package:insiit/homepage.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';
import 'package:insiit/weekly_menu/interface.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(loginPage());

bool isGuest = true;

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
            // fontFamily: GoogleFonts.getFont("Oswald"),
            primarySwatch: Colors.green,
            textTheme: GoogleFonts.comfortaaTextTheme()),
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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "InsIIT",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "All things IITGN",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
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
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / (1.6),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      guestLogin(context: context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.black54,
                        ),
                        Text(
                          " Login as Guest",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
