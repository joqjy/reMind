import 'package:flutter/material.dart';

class PhotoAlbum extends StatefulWidget {
  @override
  _PhotoAlbumState createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Album"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_card_rounded),
            tooltip: 'Info',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add photos of your family members and friends!')));
            },
          )
        ]
      ),
      body: const Center(
        child: Text( 'This is the home page', style: TextStyle(fontSize: 24),
    ),
    ),
    );
  }
}
