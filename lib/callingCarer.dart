import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xaa5a5a5a),
          body: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 350,
                    // height: 90,
                    padding: EdgeInsets.only(left:0,top:60, bottom:0),
                    child: Text("Sarah Mei", style: TextStyle(color: Colors.white, fontSize: 50),),
                  ),
                  Container(
                    padding:EdgeInsets.only(left: 5, right: 5, bottom: 50,top:0),
                    child: Text("calling...", style: TextStyle(color: Color(0xaa5a5a5a).withOpacity(0.9), fontSize: 30),),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10
                    ),
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.mic_off_rounded),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.dialpad_rounded),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10
                    ),
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.video_call),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaa808080),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.account_circle_rounded),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10
                    ),
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xaaff0000),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.call_end),
                          onPressed: (){},
                          color: Colors.white,
                          iconSize: 70,
                        ),
                      ),
                    ],
                  )
                ],
              )
          )
      )
  ));
}