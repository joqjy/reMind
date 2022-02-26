import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class PhotoAlbum extends StatefulWidget {
  const PhotoAlbum({Key? key}) : super(key: key);

  @override
  _PhotoAlbumState createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      onWillPop: () async{
          if(isDialOpen.value){
            isDialOpen.value = false;
            return false;
          }else{
            return true;
          }
        }, */
      appBar: AppBar(
          title: const Text("Photo Album"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_card_rounded),
              tooltip: 'Info',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(
                        'Add photos of your family members and friends!')));
              },
            )
          ]
      ),
      body: const Center(
        child: Text('Photo Album', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.white60,
        //overlayColor: Colors.black,
        //overlayOpacity: 0.5,
        spacing: 15,
        spaceBetweenChildren: 15,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: Icon(Icons.photo_album),
              label: 'From Gallery',
              backgroundColor: Colors.lightBlueAccent,
              onTap: () {
                print('Gallery selected');
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.camera),
              label: 'From Camera ',
              backgroundColor: Colors.lightBlueAccent,
              onTap: () {
                print('Camera selected');
              }
          ),
        ],
      ),
    );
  }
}
