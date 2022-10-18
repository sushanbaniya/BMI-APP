import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widget/drawer.dart';
import './screens/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.pink),
        buttonColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
          ),
        ),
        // textTheme: TextTheme(labelSmall: TextStyle(color: Colors.black))
      ),
      routes: {
        About.routeName: (ctx) => About(),

      }
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var result;
  var resultString;
  var _nameController = TextEditingController();
  var _heightController = TextEditingController();
  var _weightController = TextEditingController();

  void submit() {
    var weight = double.parse(_weightController.text);
    var height = double.parse(_heightController.text);
    result = (weight / (height * height)).toStringAsFixed(2);
    resultString = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'BMI APP',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 300,
              height: MediaQuery.of(context).size.height /2 ,

              color: Colors.pink,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Enter Name'),
                      ),
                      controller: _nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Enter Height in metres'),
                      ),
                      controller: _heightController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Enter Weight in kg'),
                      ),
                      controller: _weightController,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Calculate BMI',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        submit();
                      });
                    },
                  ),
                  FaIcon(FontAwesomeIcons.handPointUp, color: Colors.white),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  result == null
                      ? Text('')
                      : Card(
                          borderOnForeground: true,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              'YOUR BMI IS $resultString ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 30),
                  FaIcon(FontAwesomeIcons.person, color: Colors.white, size: 40)
                ],
              ),
            ),
            // FaIcon(FontAwesomeIcons.person, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
