import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("India, Mumbai", style: TextStyle(color: Colors.black)),
            bottom: _weatherTabs(),
            leading: Icon(Icons.menu, color: Colors.black),
            actions: <Widget>[Icon(Icons.search, color: Colors.black)],
          ),
          body: TabBarView(
            children: <Widget>[
              _weatherToday(),
              Text("sample2"),
              Text("sample3"),
            ],
          ),
        ),
      ),
    );
  }

  TabBar _weatherTabs() {
    return TabBar(
      tabs: <Widget>[
        Tab(
          child: Text("Today", style: TextStyle(color: Colors.black)),
        ),
        Tab(
          child: Text("Tomorrow", style: TextStyle(color: Colors.black)),
        ),
        Tab(
          child: Text("Next Week", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  SingleChildScrollView _weatherToday() =>
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            currentStatus(),
            Container(
                alignment: Alignment.topLeft,
                child: Text("Next 15 Days")),
            futureStatus(),
          ],
        ),
      );

  Container currentStatus() =>
      Container(
        child: Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(16.0, 50, 16, 16),
                child: Image.asset('assets/images/weather_bg.png')),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text("25 C", style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 60)),
                  Text("Clouds & sun", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 18)),
                  Text("Humidity", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 14)),
                  Text("35 C", style: TextStyle(fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      );

  Container futureStatus() =>
      Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _weatherStatusCard(
                  "Monday", "assets/images/light_cloud.png", "50C", "52", "64",
                  Colors.greenAccent),
              _weatherStatusCard(
                  "Tuesday", "assets/images/light_cloud.png", "50C", "52", "64",
                  Colors.pink),
              _weatherStatusCard(
                  "Wednessday", "assets/images/light_cloud.png", "50C", "52",
                  "64", Colors.amber),
              _weatherStatusCard(
                  "Thursday", "assets/images/light_cloud.png", "50C", "52",
                  "64", Colors.blueGrey),
              _weatherStatusCard(
                  "Friday", "assets/images/light_cloud.png", "50C", "52", "64",
                  Colors.orange),
              _weatherStatusCard(
                  "Tuesday", "assets/images/light_cloud.png", "50C", "52", "64",
                  Colors.pink),
              _weatherStatusCard(
                  "Wednessday", "assets/images/light_cloud.png", "50C", "52",
                  "64", Colors.amber),
              _weatherStatusCard(
                  "Thursday", "assets/images/light_cloud.png", "50C", "52",
                  "64", Colors.blueGrey),
              _weatherStatusCard(
                  "Friday", "assets/images/light_cloud.png", "50C", "52", "64",
                  Colors.orange),
            ],
          ),
        ),
      );

  Card _weatherStatusCard(String day, String icon, String w1, String w2,
      String w3, Color color) =>
      Card(
        color: color,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          width: 100.0,
          height: 200.0,
          child: Column(
            children: <Widget>[
              Text(day),
              Image.asset(icon),
              Text(w1),
              Row(
                children: <Widget>[
                  Text(w2),
                  Text(w3),
                ],
              )
            ],
          ),
        ),
      );
}