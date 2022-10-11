import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "InsIIT",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Center(
            child: Text(
          "Hello, Welcome to InsIIT the institute app",
          style: TextStyle(color: Colors.white),
        )),
        floatingActionButton: FloatingActionButton(
          child: Text("click"),
          onPressed: null,
        ),
      ),
    ));
