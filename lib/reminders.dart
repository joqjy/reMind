// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class DynamicWidget extends StatelessWidget {
  String name = '';
  String time = '';

  DynamicWidget(String n,t) {
    this.name = n;
    this.time = t;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // IconButton(
          //   icon: Image.asset('assets/file.png'),
          //   iconSize: 140,
          //   onPressed: () {},
          // ),
          // Text(name),
          Card(
              color:
                name == 'Eat Medicine' 
                ? const Color(0xaac7ffe0) 
                : const Color(0xaaffdddd),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                  leading: Icon(
                    Icons.food_bank_outlined,
                    size: 45,
                  ),
                  title: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    time,
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.6)),
                  )),
          ),
        ],
      ),
    );
  }
}

class _RemindersPageState extends State<RemindersPage> {
  List<DynamicWidget> listDynamic = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  addDynamic(String name, String time) {
    listDynamic.add(new DynamicWidget(name,time));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(children: <Widget>[
              Text('test'),
              Flexible(
                child: new ListView.builder(
                    itemCount: listDynamic.length,
                    itemBuilder: (_, index) => listDynamic[index]),
              ),
            ]),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext ctx) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              // prevent the soft keyboard from covering text fields
                              bottom:
                                  MediaQuery.of(ctx).viewInsets.bottom + 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Description'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: _timeController,
                                decoration: const InputDecoration(
                                    labelText: 'Alarm Time'),
                              ),
                              ElevatedButton(
                                  child: Text('Create Reminder'),
                                  onPressed: () {
                                    // ignore: unused_local_variable
                                    final String? name = _nameController.text;
                                    final String? time = _timeController.text;
                                    //create new widget with the input name
                                    addDynamic(_nameController.text,_timeController.text);
                                    // Clear the text fields
                                    _nameController.text = '';
                                    _timeController.text = '';

                                    // Hide the bottom sheet
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ),
                        );
                      });
                },
                child: Icon(Icons.add))));
  }
}






//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Reminders")),
//       body: Center(
//         child: Column(
//           children: [
//             //Text("SATURDAY 26 FEBRUARY", style: TextStyle(fontSize: 20),),
//             Card(
//               color: const Color(0xaaffdddd),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                 leading: Icon(Icons.food_bank_outlined, size: 45,),
//                 title: Text("Remember to eat breakfast",
//                   style: TextStyle(
//                     fontSize: 20,),
//                 ),
//                 subtitle: Text(
//                   "9AM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                 )
//               ),
//             ),
//             Card(
//               color: const Color(0xaac7ffe0),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                   leading: Icon(Icons.medication_outlined, size: 45,),
//                   title: Text("Remember to take meds",
//                     style: TextStyle(
//                       fontSize: 20,),
//                   ),
//                   subtitle: Text(
//                     "10AM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                   )
//               ),
//             ),
//             Card(
//               color: const Color(0xaaffdddd),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                   leading: Icon(Icons.food_bank_outlined, size: 45,),
//                   title: Text("Remember to eat lunch",
//                     style: TextStyle(
//                       fontSize: 20,),
//                   ),
//                   subtitle: Text(
//                     "12PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                   )
//               ),
//             ),
//             Card(
//               color: const Color(0xaac7ffe0),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                   leading: Icon(Icons.medication_outlined, size: 45,),
//                   title: Text("Remember to take meds",
//                     style: TextStyle(
//                       fontSize: 20,),
//                   ),
//                   subtitle: Text(
//                     "1PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                   )
//               ),
//             ),
//             Card(
//               color: const Color(0xaaffdddd),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                   leading: Icon(Icons.food_bank_outlined, size: 45,),
//                   title: Text("Remember to eat dinner",
//                     style: TextStyle(
//                       fontSize: 20,),
//                   ),
//                   subtitle: Text(
//                     "7PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                   )
//               ),
//             ),
//             Card(
//               color: const Color(0xaac7ffe0),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//               child: ListTile(
//                   leading: Icon(Icons.medication_outlined, size: 45,),
//                   title: Text("Remember to take meds",
//                     style: TextStyle(
//                       fontSize: 20,),
//                   ),
//                   subtitle: Text(
//                     "8PM", style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
//                   )
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add_circle_outline),
//         onPressed: (){},
//         backgroundColor: Colors.white60,
//       )
//     );
//   }
// }