// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reMind/location_page.dart';
import 'package:reMind/photoAlbum.dart';
import 'package:reMind/reminderAlerts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        Stream<int>.periodic(Duration(minutes: 5), (t) => t);

    every30seconds.listen((t) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog();
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
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
              child: Text(
                "SOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}, //goes to call
            ),
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
                                color: Color.fromARGB(255, 187, 187, 187),
                              )),
                          padding: EdgeInsets.all(20),
                        ),
                        child: Image.asset(
                          'assets/profile.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                                color: Color.fromARGB(255, 187, 187, 187),
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
                        MaterialPageRoute(builder: (context) => MapSample()));
                        },
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                                color: Color.fromARGB(255, 187, 187, 187),
                              )),
                          padding: EdgeInsets.all(25),
                        ),
                        child: Image.asset(
                          'assets/reminders.png',
                          width: 90,
                          height: 90,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Reminders",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                            primary: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                side: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 187, 187, 187),
                                )),
                            padding: EdgeInsets.all(25),
                          ),
                          child: Image.asset(
                            'assets/phonebook.png',
                            width: 90,
                            height: 90,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "Phone Book",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
                    primary: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 187, 187, 187),
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
                Text(
                  "Photo Album",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
