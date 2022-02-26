// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reMind/callingCarer.dart';
import 'package:reMind/carerLocation.dart';
import 'package:reMind/home_view.dart';
import 'package:reMind/locationPage.dart';
import 'package:reMind/lostAlert.dart';
import 'package:reMind/photoAlbum.dart';
import 'package:reMind/profile.dart';
import 'package:reMind/reminderAlerts.dart';
import 'package:reMind/reminders.dart';

class CarerHomePage extends StatefulWidget {
  CarerHomePage({Key? key}) : super(key: key);

  @override
  State<CarerHomePage> createState() => _CarerHomePageState();
}

class _CarerHomePageState extends State<CarerHomePage> {
  // TextEditingController _answerController = TextEditingController();

  // createAlertDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text("Eat Your Medicine!"),
  //         actions: <Widget>[
  //           MaterialButton(
  //             elevation: 5.0,
  //             child: Text('OK'),
  //             onPressed: () {},
  //           )
  //         ],
  //       );
  //     }
  //   );
  // }
  @override
  void initState() {
    super.initState();

    Stream<int> every30seconds =
        Stream<int>.periodic(Duration(seconds: 360), (t) => t);
    every30seconds.listen((t) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return LostAlert();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(75.0),
                ),
                padding: EdgeInsets.fromLTRB(35,16,35,16),
              ),
              child: Text(
                "SOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CallingCarer()));
              }, //goes to call
            ),
            SizedBox(height: 18),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              side: BorderSide(
                                width: 2,
                                color: Colors.transparent,
                              )),
                          padding: EdgeInsets.all(20),
                        ),
                        child: Image.asset(
                          'assets/profile.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));},
                      ),
                      SizedBox(height:5),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              side: BorderSide(
                                width: 2,
                                color: Colors.transparent,
                              )),
                          padding: EdgeInsets.all(20),
                        ),
                        child: Image.asset(
                          'assets/location.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CarerLocation()));
                        },
                      ),
                      SizedBox(height:5),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ]),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              side: BorderSide(
                                width: 2,
                                color: Colors.transparent,
                              )),
                          padding: EdgeInsets.all(25),
                        ),
                        child: Image.asset(
                          'assets/reminders.png',
                          width: 90,
                          height: 90,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RemindersPage()));
                        },
                      ),
                      SizedBox(height:5),
                      Text(
                        "Reminders",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                side: BorderSide(
                                  width: 0,
                                  color:Colors.transparent,
                                )),
                            padding: EdgeInsets.all(25),
                          ),
                          child: Image.asset(
                            'assets/phonebook.png',
                            width: 90,
                            height: 90,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Homeview()));
                          },
                        ),
                        SizedBox(height:5),
                        Text(
                          "Phone Book",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                ]),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 15, left: 20, right: 20),
                  ),
                  child: Image.asset(
                    'assets/photoalbum.png',
                    width: 100,
                    height: 100,
                  ),
                  onPressed: () {              
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhotoAlbum()));
                  },
                ),
                SizedBox(height:5),
                Text(
                  "Photo Album",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
