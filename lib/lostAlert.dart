// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LostAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(10,30,10,30),
      title: 
        Center(
          child:Text(
            "AH MEI IS LOST!",
            style: TextStyle(
              fontSize: 28,
              color: Colors.red,
            ),
          ),
        ),
      actions: <Widget>[
        Center(
          child:ElevatedButton(
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 113, 219, 116)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CALL',
                    style: TextStyle(fontSize:20),
                ),
                Container(
                  child: Icon(Icons.phone),
                )
              ]
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ],
      content:
        Text(
          "Ah Mei is currently lost at Bishan Ang Mo Kio Park.",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
    );
  }
}
