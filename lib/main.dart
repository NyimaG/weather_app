import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: weather(),
    );
  }
}

class weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<weather> {
  final titleController = TextEditingController();
  String cityname = " ";
  String weather_cond = " ";
  var temp = 0;
  void _setText() {
    setState(() {
      cityname = titleController.text;
      weather_cond = "Sunny";
      temp = Random().nextInt(16) + 15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your city'),
              ),
              ElevatedButton(
                  onPressed: _setText,
                  /*style: ButtonStyle(
                    backgroundColor:Colors.amber),*/
                  child: const Text('Fetch Weather')),
              SizedBox(height: 16.0),
              Text(
                'City Name: $cityname',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Temperature: $temp degrees celsius',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Weather Condition: $weather_cond',
                style: TextStyle(fontSize: 20.0),
              ),
            ]),
      ),
    );
  }
}
