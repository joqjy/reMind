//import 'dart:html';
import 'package:flutter/services.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:photo_card_swiper/models/photo_card.dart';
import 'package:photo_card_swiper/photo_card_swiper.dart';


class PhotoAlbum extends StatefulWidget {
  PhotoAlbum({Key? key}) : super(key: key);

  List<PhotoCard> _photos = [
    PhotoCard(
      title: 'Ah gong and Steve',
      description: 'My Husband and Grandson',
      imagePath: 'assets/Husband&Grandson.png',
      cardId: '1'),
    PhotoCard(
      title: 'My Sarah',
      description: 'My Daughter',
      imagePath: 'assets/Daughter.png',
      cardId: '2'),
    PhotoCard(
        title: 'Sarahs Husband, John',
        description: 'My Son-in-Law',
        imagePath: 'assets/SIL.jpg',
        cardId: '3')];


  @override
  _PhotoAlbumState createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {

  /*
  void addPhoto1() async {
    PhotoCard newPhoto1 = PhotoCard(
    title: 'Sarahs Husband, John',
    description: 'My Son-in-Law',
    imagePath: 'assets/SIL.jgp',
    cardId: '3');
    _photos.add(newPhoto1);
  }
 */
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

  /*
  var imgList = List<ListItem>;

  final CarouselSlider autoPlayDemo = CarouselSlider( options: CarouselOptions(viewportFraction: 0.9, aspectRatio: 2.0, autoPlay: false, enlargeCenterPage: true),
    items: imgList.map(
          (child) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(5.0)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DiscoverAppBarWidget(),
              Expanded(
                child: Stack(
                  children: [
                    NoMoreDataWidget(),
                    PhotoCardSwiper(
                      photos: widget._photos,
                      //cardSwiped: _cardSwiped,
                      showLoading: false,
                      hideCenterButton: false,
                      hideTitleText: false,
                      hideDescriptionText: false,
                      imageScaleType: BoxFit.cover,
                      imageBackgroundColor: Colors.grey,
                      leftButtonIcon: Icons.remove_circle_outline,
                      rightButtonIcon: Icons.edit,
                      centerButtonIcon: Icons.favorite,
                      leftButtonBackgroundColor: Colors.red[100],
                      leftButtonIconColor: Colors.red[600],
                      centerButtonBackgroundColor: Colors.lightBlue[50],
                      centerButtonIconColor: Colors.lightBlue[600],
                      rightButtonBackgroundColor: Colors.lightGreen[100],
                      rightButtonIconColor: Colors.lightGreen[700],
                      leftButtonAction: _leftButtonClicked,
                      centerButtonAction: _centerButtonClicked,
                      rightButtonAction: _rightButtonClicked,
                      onCardTap: _onCardTap,
                      loop: true;
                    ),
                ],

                )
              ),
              SizedBox(height: 20.0,)
          ],
        ),
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

                setState(() {});

              }
          ),
        ],
      ),
    );
  }
}

//Callbacks from  SwipeCardsLayoutWidget
void _onCardTap(int _index) {
  print('Card with index $_index is Tapped.');
  //Here you can navigate to detail screen or so.
}

void _leftButtonClicked() {
  print('Left button clicked');
}

void _centerButtonClicked() {
  print('Center button clicked');
}

void _rightButtonClicked() {
  print('Right button clicked');
}

//Secondary Widgets
class NoMoreDataWidget extends StatelessWidget {
  const NoMoreDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        child: Column(
          children: [
            Icon(
              Icons.error,
              size: 60.0,
              color: Colors.grey,
            ),
            Text(
              'No more data found.',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiscoverAppBarWidget extends StatelessWidget {
  const DiscoverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 60.0,
        left: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        'My Family',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 32.0,
            color: Colors.grey[850]),
      ),
    );
  }
}