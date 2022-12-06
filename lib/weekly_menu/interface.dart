import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insiit/messmenu/googleSheetAPI.dart';

Future<void> main() async {
  await userSheetsAPI.getMeal(2, 0);
  messItems = userSheetsAPI.mealItems;
  print("main ran: ");
  print(messItems);
  runApp(WeeklyMenuTemp());
}

List<String> dummyList = ["Sandeep", "Desai"];
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

// class WeeklyMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Weekly Mess Menu")),
//       body: Column(
//         children: [
//           for (String item in messItems) Text(item),
//         ],
//       ),
//     );
//   }
// }

class WeeklyMenuTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  // const dynamic_widget({Key? key,required this.day}) : super(key: key);
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
        for (String item in userSheetsAPI.temp_meals[day][mealType])
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
