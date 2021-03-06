// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reMind/carerLocation.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reMind',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'reMind'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   //to have fixed width and height for the image
            //   width: 150,
            //   height: 150,
            //   child: Image.asset('assets/notebookIcon.jpg'),
            // ),
            Text(
              "Welcome to reMind!",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(right: 50, left: 50, top: 30),
              child: TextFormField(
                controller: _questionController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top:5),
              child: TextFormField(
                controller: _answerController,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 125,
                      height: 125,
                      child: MaterialButton(
                        onPressed: () {
                          if (_questionController.text != '' &&
                              _answerController.text != '') {
                            Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                        },
                        child: Image.asset('assets/patient_icon.png'),
                      ),
                    ),
                    Text(
                      "I am a Patient",
                      style:TextStyle(fontSize: 18),
                    ),
                  ]),
              SizedBox(
                width: 30,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 125,
                      height: 125,
                      child: MaterialButton(
                        onPressed: () {
                          if (_questionController.text != '' &&
                              _answerController.text != '') {
                            Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => CarerLocation()));
                          }
                        },
                        child: Image.asset('assets/caretaker_icon.png'),
                      ),
                    ),
                    Text(
                      "I am a Caretaker",
                      style:TextStyle(fontSize: 18),
                    ),
                  ]),
            ]),

            // Container(
            //   child: MaterialButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => HomePage()));
            //     },
            //     child: Text("Login"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
