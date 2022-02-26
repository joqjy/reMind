import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xaaadadad),
      appBar: AppBar(title: Text("I'm Lost")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.amber,
              ),
                child: ListTile(
                    leading: Icon(Icons.notifications_on_outlined, size: 75,),
                    title: Text("I'm Lost!!!",
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Ah Mei is lost at AngMoKio Hub", style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8)),
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: (){},
                child: Text("Call Ah Mei", style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
    ),

    ),
    ),
    );

}