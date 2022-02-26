import 'splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class PhotoAlbum extends StatefulWidget {
  PhotoAlbum({Key? key}) : super(key: key);

  @override
  _PhotoAlbumState createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {

  File? image;

  Future pickImage(ImageSource source) async {
   try{
     final image = await ImagePicker().pickImage(source: source);
     if (image==null) return;

     String path = image.path;
     //final imageTemporary = File(path);
     final imagePerm = await saveImagePermanently(path);
     setState(() => this.image = imagePerm);
   } on PlatformException catch (e) {
     print("Failed to select image: $e");
   }
  }

  Future<File> saveImagePermanently(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(path);
    final image = File('${directory.path}/$name');

    return File(path).copy(path);
  }

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
      body: Splash(),

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
              label: 'Add From Gallery',
              backgroundColor: Colors.lightBlueAccent,
              onTap: () {
                print('Gallery selected');
                pickImage(ImageSource.gallery);

              }
          ),
          SpeedDialChild(
              child: Icon(Icons.camera),
              label: 'Add From Camera ',
              backgroundColor: Colors.lightBlueAccent,
              onTap: () {
                print('Camera selected');
                pickImage(ImageSource.camera);
              }
          ),
        ],
      ),
    );
  }
}
