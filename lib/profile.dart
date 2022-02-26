import 'package:flutter/material.dart';

void profile() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Personal Details")),
          body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
            radius: 100.0,
            child: ClipRRect(
              child: Image.asset('assets/Old-Lady-Circle.png'),
              borderRadius: BorderRadius.circular(50.0),
              ),),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("Name: Ah mei",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,),
                ),
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("Caretaker's Number: 91234567",
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_pin),
                title: Text("Address: Block 347 Ang Mo Kio Ave 3, Singapore 560347",
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,),
                ),
              ),
              ListTile(
                leading: Icon(Icons.health_and_safety_outlined),
                title: Text("Health Conditions: Dementia",
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
  );
}

