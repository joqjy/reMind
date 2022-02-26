// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  // final String title;
  // final String content;
  // final List<Widget> actions;

  // MyAlertDialog({
  //   this.title = "Reminder!",
  //   this.content = "Eat Medicine",
  //   this.actions = const [],
  // });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Reminder!",
        //style: Theme.of(context).textTheme.title,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
      content: Text(
        "Eat Medicine!"
        //style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}