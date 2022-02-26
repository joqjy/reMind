
import 'package:flutter/material.dart';
import 'package:reMind/style_card.dart';
//import 'package:flutter_stacked_card_carousel/style_card.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class StackedCardDemo extends StatefulWidget {

  @override
  _StackedCardDemoState createState() => _StackedCardDemoState();
}

class _StackedCardDemoState extends State<StackedCardDemo> {
  final List<Widget> styleCards = [
    StyleCard(
      image: Image.asset("assets/AhMei.png"),
      title: "Ah Mei",
      description: "Me, myself and I",
    ),
    StyleCard(
      image: Image.asset("assets/Husband&Grandson.png"),
      title: "My Husband and my second grandson",
      description: "This was at my grandson's third birthday party!",

    ),
    StyleCard(
      image: Image.asset("assets/kids.jpg"),
      title: "My sweet grandchildren <3",
      description: "During 2019 Chinese New Year",

    ),
    StyleCard(
      image: Image.asset("assets/Daughter.png"),
      title: "My Daughter",
      description: "Sarah Mei, I love you",

    ),
    StyleCard(
      image: Image.asset("assets/SIL.jpg"),
      title: "My Son-in-Law, John",
      description: "Thank you for taking care of my daughter",
    ),
    StyleCard(
      image: Image.asset("assets/family.jpg"),
      title: "My Family",
      description: "On 28/01/2021",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Photo Album'),
      ),
      body: StackedCardCarousel(
        initialOffset: 40,
        spaceBetweenItems:400 ,
        items: styleCards,
      ),
    );
  }
}