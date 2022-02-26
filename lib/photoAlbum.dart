import 'dart:html';
import 'package:flutter/services.dart';
//import 'package:universal_io/io.async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:carousel_slider/carousel_slider.dart';


class PhotoAlbum extends StatefulWidget {
  const PhotoAlbum({Key? key}) : super(key: key);


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
     final imageTemporary = File(path);
     setState(() => this.image = imageTemporary);
   } on PlatformException catch (e) {
     print("Failed to select image: $e");
   }
  }


/*
  final CarouselSlider autoPlayDemo = CarouselSlider( viewportFraction: 0.9, aspectRatio: 2.0, autoPlay: false, enlargeCenterPage: true,
    items: imgList.map(
          (child) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: image != null ? Image.file(image!,
                  fit: BoxFit.cover,
                  width: 500.0,) : Image.asset(AppBackground.png,
                  fit: BoxFit.cover,
                  width: 500.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'Text',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).toList(),
  );
*/
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
      /*body: const Center(
        child: Text('Photo Album', style: TextStyle(fontSize: 24)),
      ),*/
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(

        )
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
                pickImage(ImageSource.gallery);
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.camera),
              label: 'From Camera ',
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
