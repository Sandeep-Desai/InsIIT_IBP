import 'package:flutter/material.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';

// To access a meal of specific day and type we can use temp meals, at start
// of app this matrix of is filled with values from google sheet
// For example we want to access meal for Wednesday's lunch, we can use
// List<String> wednesday_meal=temp_meal[2][1]

// Indexing is as follwing
// Day First Index  Meal Type Second Index
// Mon   0          Breakfast    0
// Tue   1          Lunch        1
// Wed   2          Snacks       2
// Thurs 3          Dinner       3
// Fri   4
// Sat   5
// Sun   6

// Future<void> main() async {
//   await userSheetsAPI.getMeal(2, 0);
//   messItems = userSheetsAPI.mealItems;

//   runApp(WeeklyMenuTemp());
// }

List<String> messItems = userSheetsAPI.mealItems;
List meals = ["Breakfast", "Lunch", "Snacks", "Dinner"];

List day_names = [
  "Monday",
  "Tuesday",
  "Webnesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

class WeeklyMenuTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Weekly Mess Menu"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (int i = 0; i < 7; i++)
                  Tab(
                    text: day_names[i],
                  )
              ],
            ),
          ),
          body: TabBarView(children: [
            for (int i = 0; i < 7; i++) dynamic_widget(day: i),
          ]),
        ),
      ),
    );
  }
}

class dynamic_widget extends StatelessWidget {
  final int day;

  dynamic_widget({
    Key? key,
    required this.day,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 4; i++)
            ExpansionTile(
              title: Text(
                meals[i],
                style: TextStyle(fontSize: 18),
              ),
              children: [
                mealTypeBody(day: day, mealType: i),
              ],
            ),
        ],
      ),
    );
  }
}

class mealTypeBody extends StatelessWidget {
  final int mealType;
  final int day;
  mealTypeBody({
    Key? key,
    required this.mealType,
    required this.day,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (String item in temp_meals[day][mealType])
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              title: Text(
                item,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
      ],
    );
  }
}
