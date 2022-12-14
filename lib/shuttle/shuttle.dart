import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

void addBusRoute(
    String start, String dest, List<String> stops, String departure_time) {
  var newRoute = new busRoute();
  newRoute.dest = dest;
  newRoute.start = start;
  newRoute.stops = stops;
  newRoute.departure_time = departure_time;
  busRoutes.add(newRoute);
}

List<busRoute> findRoutes(String src, String dest) {
  List<busRoute> temp = [];
  for (var i = 0; i < busRoutes.length; i++) {
    // print(busRoutes[i]);
    if (busRoutes[i].start == "IITGN" && src == "IITGN") {
      print("Hello");
      for (var j = 0; j < busRoutes[i].stops.length; j++) {
        if (dest == busRoutes[i].stops[j]) {
          temp.add(busRoutes[i]);
          break;
        }
      }
      if (busRoutes[i].dest == dest) {
        temp.add(busRoutes[i]);
      }
    } else {
      if (dest == "IITGN") {
        if (busRoutes[i].dest == "IITGN") {
          if (busRoutes[i].start == src) {
            temp.add(busRoutes[i]);
          } else {
            for (int j = 0; j < busRoutes[i].stops.length; j++) {
              // print("Hello");
              if (busRoutes[i].stops[j] == src) {
                temp.add(busRoutes[i]);
                break;
              }
            }
          }
        }
      }
    }
  }
  print(temp);
  return temp;
}

void main() {
  addBusRoute("AB 1", "Visat Circle", ["Research Park", "Gate 2", "Kudasan"],
      "5:15 PM");
  print(busRoutes);
  runApp(shuttlePage());
}

// var busRoutes = [
//   {
//     "start": "AB 1",
//     "dest": "Visat Circle",
//     "stops": ["Research Park", "Gate 2", "Kudasan", "Rakshashakti"]
//   },
// ];
String? dropdownvalue;
String? dropdownvalue2;
var busStops = ["IITGN", "Kudasan", "Rakshashakti", "Visat"];
var busStops2 = ["IITGN", "Kudasan", "Rakshashakti", "Visat"];

class busRoute {
  String start = "";
  String dest = "";
  List<String> stops = [];
  String departure_time = "";
}

List<busRoute> busRoutes = [];

List<Widget> currentRoutes = [];

class shuttlePage extends StatefulWidget {
  @override
  shuttlePageState createState() => shuttlePageState();
}

class shuttlePageState extends State<shuttlePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeDelta: 2.0,
                  fontSizeFactor: 0.7,
                )),
        home: Scaffold(
          appBar: AppBar(title: Text("Shuttle")),
          body: Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                // color: Color.fromARGB(255, 201, 200, 200),
                // border: Border.all(width: 2, color: Colors.grey),
                // borderRadius: BorderRadius.circular(10),
                ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButton(
                        value: dropdownvalue,
                        items: busStops.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment,

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButton(
                        // dropdownColor: Colors.blueGrey,
                        value: dropdownvalue2,
                        items: busStops2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        findAndShowBusRoutes();
                      });
                    },
                    child: Container(
                      child: Icon(Icons.search),
                    ),
                  ),

                  Column(
                    children: currentRoutes,
                  )
                  // busRouteItem3(),
                ],
              ),
            ),
          ),
        ));
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //         appBar: AppBar(
  //           title: Text("Shuttle"),
  //         ),
  //         body: Container(
  //           child: busRouteItem(),
  //         )),
  //   );
  // }
}

// class busRouteItem extends StatelessWidget {
//   // final int index = 0;
//   // List<String> stops=(busRoutes[0]["stops"]);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 // Text("IITGN"),
//                 DotIndicator(),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   height: 2,
//                   child: SolidLineConnector(
//                     thickness: MediaQuery.of(context).size.width / 5,
//                     direction: Axis.horizontal,
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     OutlinedDotIndicator(
//                         // size: 10,
//                         ),
//                     // Text("AB1"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 2,
//                   child: SolidLineConnector(
//                     thickness: MediaQuery.of(context).size.width / 5,
//                     direction: Axis.horizontal,
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     OutlinedDotIndicator(
//                         // size: 10,
//                         ),
//                     // Text("AB1"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 2,
//                   child: SolidLineConnector(
//                     thickness: MediaQuery.of(context).size.width / 5,
//                     direction: Axis.horizontal,
//                   ),
//                 ),
//               ],
//             ),
//             DotIndicator(),
//             // Text("Visat Circle"),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("IITGN"),
//             Text("AB1"),
//             Text("Kudasan"),
//             Text("Visat")
//           ],
//         )
//       ],
//     );
//   }
// }

class busRouteItem2 extends StatelessWidget {
  String start;
  String dest;
  List<String> stops;
  busRouteItem2({
    Key? key,
    required this.start,
    required this.dest,
    required this.stops,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Indicators(
          noOfItems: stops.length + 2,
        ),
        TextLocations(
          stops: stops,
          dest: dest,
          start: start,
        ),
      ],
    );
  }
}

class Indicators extends StatelessWidget {
  var noOfItems = 0;
  Indicators({
    Key? key,
    required this.noOfItems,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DotIndicator(),
        for (int i = 0; i < noOfItems - 2; i++)
          outlinedDotItem(
            noOfItems: noOfItems,
          ),
        SizedBox(
          height: 2,
          child: SolidLineConnector(
            thickness: MediaQuery.of(context).size.width / (noOfItems + 1),
            direction: Axis.horizontal,
          ),
        ),
        DotIndicator(),
      ],
    );
  }
}

class TextLocations extends StatelessWidget {
  List<String> stops = [];
  String start;
  String dest;
  TextLocations({
    Key? key,
    required this.stops,
    required this.dest,
    required this.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(start),
        for (int i = 0; i < stops.length; i++) Text(stops[i]),
        Text(dest),
      ],
    );
  }
}

class outlinedDotItem extends StatelessWidget {
  var noOfItems = 0;
  outlinedDotItem({
    Key? key,
    required this.noOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 2,
          child: SolidLineConnector(
            thickness: MediaQuery.of(context).size.width / (noOfItems + 1),
            direction: Axis.horizontal,
          ),
        ),
        OutlinedDotIndicator(),
        // SizedBox(
        //   height: 2,
        //   child: SolidLineConnector(
        //     thickness: MediaQuery.of(context).size.width / 5,
        //     direction: Axis.horizontal,
        //   ),
        // ),
      ],
    );
  }
}

void findAndShowBusRoutes() {
  List<Widget> currentTemp = [];

  String src = dropdownvalue!;
  String dest = dropdownvalue2!;
  if (src == null || dest == null) {
    return;
  } else {
    List<busRoute> templist = findRoutes(src, dest);
    print(templist.length);
    for (int i = 0; i < templist.length; i++) {
      currentTemp.add(busRouteItem3(
        start: templist[i].start,
        dest: templist[i].dest,
        stops: templist[i].stops,
        dept_time: templist[i].departure_time,
      ));
    }
  }
  currentRoutes = currentTemp;
}

class busRouteItem3 extends StatelessWidget {
  List<String> stops = [];
  String start;
  String dest;
  String dept_time = "";
  busRouteItem3({
    Key? key,
    required this.stops,
    required this.dest,
    required this.start,
    required this.dept_time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(76, 255, 235, 59),
          border:
              Border.all(width: 2, color: Color.fromARGB(102, 255, 235, 59))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("From: " + start),
              Text("To: " + dest),
              Text("Stops at: " + addStrings(stops)),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(color: Colors.green, Icons.alarm), Text(dept_time)],
          ),
        ],
      ),
    );
  }
}

String addStrings(List<String> stops) {
  String sum = "";
  for (int i = 0; i < stops.length; i++) {
    sum = sum + stops[i] + ", ";
  }

  return sum;
}
