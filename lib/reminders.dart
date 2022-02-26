import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reminders")),
      body: Center(
        child: Column(
          children: [
            //Text("SATURDAY 26 FEBRUARY", style: TextStyle(fontSize: 20),),
            Card(
              color: const Color(0xaaffdddd),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                leading: Icon(Icons.food_bank_outlined, size: 45,),
                title: Text("Remember to eat breakfast",
                  style: TextStyle(
                    fontSize: 20,),
                ),
                subtitle: Text(
                  "9AM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                )
              ),
            ),
            Card(
              color: const Color(0xaac7ffe0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(Icons.medication_outlined, size: 45,),
                  title: Text("Remember to take meds",
                    style: TextStyle(
                      fontSize: 20,),
                  ),
                  subtitle: Text(
                    "10AM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )
              ),
            ),
            Card(
              color: const Color(0xaaffdddd),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(Icons.food_bank_outlined, size: 45,),
                  title: Text("Remember to eat lunch",
                    style: TextStyle(
                      fontSize: 20,),
                  ),
                  subtitle: Text(
                    "12PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )
              ),
            ),
            Card(
              color: const Color(0xaac7ffe0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(Icons.medication_outlined, size: 45,),
                  title: Text("Remember to take meds",
                    style: TextStyle(
                      fontSize: 20,),
                  ),
                  subtitle: Text(
                    "1PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )
              ),
            ),
            Card(
              color: const Color(0xaaffdddd),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(Icons.food_bank_outlined, size: 45,),
                  title: Text("Remember to eat dinner",
                    style: TextStyle(
                      fontSize: 20,),
                  ),
                  subtitle: Text(
                    "7PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )
              ),
            ),
            Card(
              color: const Color(0xaac7ffe0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(Icons.medication_outlined, size: 45,),
                  title: Text("Remember to take meds",
                    style: TextStyle(
                      fontSize: 20,),
                  ),
                  subtitle: Text(
                    "8PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )
              ),
            ),
            IconButton(icon: Icon(Icons.add_circle_outline),
              color: Colors.blue,
              onPressed: (){},
              iconSize: 60,
            )
          ],
        ),
      ),
    );
  }
}