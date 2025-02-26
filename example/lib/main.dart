import 'package:flutter/material.dart';
import 'package:calendar_san/calendar_san.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ejemplo para probar json serialization y ver si podemos recibir datos de delphos
  String sendCalendarFeatures() {
    //example of json serialization
    String json = """{
      "Schedules": [
        {
          "Professor": "Juanito",
          "Subject": "Español",
          "Details": [
            {
              "inihour": "7",
              "inimin": "00",
              "endhour": "9",
              "endmin": "00",
              "day": "1"
            },
            {
              "inihour": "10",
              "inimin": "00",
              "endhour": "12",
              "endmin": "00",
              "day": "3"
            }
          ]
        },
        {
          "Professor": "Pepito",
          "Subject": "Matemáticas",
          "Details": [
            {
              "inihour": "7",
              "inimin": "00",
              "endhour": "9",
              "endmin": "00",
              "day": "2"
            },
            {
              "inihour": "10",
              "inimin": "00",
              "endhour": "12",
              "endmin": "00",
              "day": "4"
            }
          ]
        }
      ]
    }""";
    return json;
  }

  @override
  Widget build(BuildContext context) {
    const String json = """{
      "Schedules": [
        {
          "Professor": "Juanito",
          "Subject": "Español",
          "Details": [
            {
              "inihour": "7",
              "inimin": "00",
              "endhour": "9",
              "endmin": "00",
              "day": "1"
            },
            {
              "inihour": "10",
              "inimin": "00",
              "endhour": "12",
              "endmin": "00",
              "day": "3"
            }
          ]
        },
        {
          "Professor": "Pepito",
          "Subject": "Matemáticas",
          "Details": [
            {
              "inihour": "7",
              "inimin": "00",
              "endhour": "9",
              "endmin": "00",
              "day": "2"
            },
            {
              "inihour": "10",
              "inimin": "00",
              "endhour": "12",
              "endmin": "00",
              "day": "4"
            }
          ]
        }
      ]
    }""";


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const Column(
        children: [
          CalendarSan(
            startDay: 1,
            endDay: 6,
            startHour: 4,
            endHour: 15,
          ),
        ],
      ),
    );
  }
}
