// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            SizedBox(height:50),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(30),
              ),
              child: Text(
                "SOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onPressed:(){}, //goes to call
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(
                        width: 2,
                        color: Colors.black,
                      )
                    ),
                    padding: EdgeInsets.only(top:50, bottom:50, left:30, right:30),
                  ),
                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize:25,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(
                        width: 2,
                        color: Colors.black,
                      )
                    ),
                    padding: EdgeInsets.only(top:50, bottom:50, left:20, right:20),
                  ),
                  child: Text(
                    "Location",
                    style: TextStyle(
                      fontSize:25,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {},
                ),
              ]
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(
                        width: 2,
                        color: Colors.black,
                      )
                    ),
                    padding: EdgeInsets.only(top:50, bottom:50, left:30, right:30),
                  ),
                  child: Text(
                    "Reminders",
                    style: TextStyle(
                      fontSize:25,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {},
                ),
                Container(
                  height:50,
                  width: 50,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )
                      ),
                    ),
                  child:ElevatedButton(
                    child: Image.asset('assets/phonebook.png'),
                    onPressed: () {},
                  ),
                ),
              ]
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(
                    width: 2,
                    color: Colors.black,
                  )
                ),
                padding: EdgeInsets.only(top:50, bottom:50, left:20, right:20),
              ),
              child: Text(
                "Photo Album",
                style: TextStyle(
                  fontSize:25,
                  color: Colors.amber,
                ),
              ),
              onPressed: () {},
            ),
          ]
        )

      ),
    );
  }
}
