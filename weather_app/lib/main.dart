import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherWidget(),
    );
  }
}

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Map<String, bool> chips = {
    "Today": true,
    "Tomorrow": false,
    "Next Week": false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child:
                  Text("India, Mumbai", style: TextStyle(color: Colors.black))),
          leading: Icon(Icons.menu, color: Colors.black),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.black),
            )
          ],
        ),
        body: _weatherToday());
  }

  Row _weatherTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chips.keys.map((String key) {
        return Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: ChoiceChip(
            label: Text(
              key,
              style: TextStyle(fontSize: 12),
            ),
            selected: chips[key],
            backgroundColor: Colors.white,
            selectedColor: Colors.grey[300],
            onSelected: (value) {
              setState(() {
                chips[key] = value;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  SingleChildScrollView _weatherToday() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _weatherTabBar(),
            currentStatus(),
            Container(
                padding: EdgeInsets.only(left: 8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Next 15 Days",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            futureStatus(),
          ],
        ),
      );

  Container currentStatus() => Container(
        child: Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
                child: Image.asset('assets/images/weather_bg.png')),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  _customizeText("25˚", 65, FontWeight.bold),
                  _customizeText("Clouds & sun", 18, FontWeight.normal),
                  _customizeText("Humidity", 14, FontWeight.normal),
                  _customizeText("35˚", 12, FontWeight.normal),
                ],
              ),
            )
          ],
        ),
      );

  Container _customizeText(String label, double size, FontWeight weight) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(label,
          style: TextStyle(
              fontWeight: weight, color: Colors.white, fontSize: size)),
    );
  }

  Container futureStatus() => Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _weatherStatusCard("Monday", "assets/images/rain.png", "40˚",
                  "52˚", "64˚", Colors.green),
              _weatherStatusCard("Tuesday", "assets/images/light_cloud.png",
                  "50˚", "52˚", "64˚", Colors.pink),
              _weatherStatusCard("Wednessday", "assets/images/light.png", "50˚",
                  "52˚", "64˚", Colors.amber),
              _weatherStatusCard("Thursday", "assets/images/sun.png", "40˚",
                  "52˚", "64˚", Colors.blueGrey),
              _weatherStatusCard("Friday", "assets/images/rain.png", "50˚",
                  "52˚", "64˚", Colors.orange),
              _weatherStatusCard("Thursday", "assets/images/sun.png", "40˚",
                  "52˚", "64˚", Colors.lightGreen),
              _weatherStatusCard("Friday", "assets/images/light_cloud.png",
                  "50˚", "52˚", "64˚", Colors.purple),
            ],
          ),
        ),
      );

  Card _weatherStatusCard(String day, String icon, String w1, String w2,
          String w3, Color color) =>
      Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 100.0,
          height: 180.0,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              _customizeText(day, 13, FontWeight.normal),
              _buildWeatherImage(icon, w1),
              _buildWeatherRow(w2, w3)
            ],
          ),
        ),
      );

  Container _buildWeatherRow(String w2, String w3) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _customizeText(w2, 13, FontWeight.normal),
            SizedBox(
              width: 10,
            ),
            _customizeText(w3, 13, FontWeight.normal),
          ],
        ),
      ),
    );
  }

  Column _buildWeatherImage(String icon, String w1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(alignment: Alignment.center, child: Image.asset(icon)),
        _customizeText(w1, 13, FontWeight.bold)
      ],
    );
  }
}
