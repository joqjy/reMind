// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAlertDialog extends StatelessWidget {
  // final String title;
  // final String content;
  // final List<Widget> actions;

  // MyAlertDialog({
  //   this.title = "Reminder!",
  //   this.content = "Eat Medicine",
  //   this.actions = const [],
  // });
  //DateTime now = DateTime.now();
  String formattedDate = DateFormat().add_jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.0))),
      titlePadding: EdgeInsets.only(top: 10),
      title: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
                Icon(
                  Icons.notifications_on_outlined,
                  size: 65,
                ),
                SizedBox(width: 10),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ),
            SizedBox(height:5),
          ],
        ),
      
      // Text(
      //   formattedDate,
      //   style: TextStyle(fontSize:20),
      // ),
      actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary:Colors.amber,
                ),
                child:
                Text(
                  'OK',
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width:7),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary:Colors.amber,
                ),
                child:
                Text(
                  'SNOOZE',
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),   
      ],
      content: 
        Text(
          "Eat Medicine!",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          
        ),
    );
  }
}