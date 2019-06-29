import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final List<String> cardItem;

  CardItem(this.cardItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cardItem
          .map((element) => Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Text(element)
          ],
        ),
      ))
          .toList(),
    );
  }
}
