// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reMind/calling.dart';

class LostAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0))),
      titlePadding: EdgeInsets.only(top: 20),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: Size(200.0, 30.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Call Ah Mei',
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    child: Icon(Icons.phone),
                  )
                ]),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Calling()));
            },
          ),
        )
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Icon(
              Icons.notifications_on_outlined,
              size: 75,
            ),
            SizedBox(width: 10),
            Text(
              "I'm Lost!!!",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          SizedBox(height: 5),
        ],
      ),
      content: Text(
        "Ah Mei is currently lost at Bishan Ang Mo Kio Park.",
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
