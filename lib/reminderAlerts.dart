// ignore_for_file: prefer_const_constructors

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
      insetPadding: EdgeInsets.all(50),
      title: Text(
        "Reminder! " + formattedDate,
        style: TextStyle(fontSize:20),
        //style: Theme.of(context).textTheme.title,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text(
            'OK',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: 
        Text(
          "Eat Medicine!",
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
    );
  }
}