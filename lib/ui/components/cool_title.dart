import 'package:flutter/material.dart';

class CoolTitle extends StatelessWidget {
  final String title;

  CoolTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        renderFirst(),
        renderRest(),
      ],
    );
  }

  Widget renderFirst() {
    var lastSpace = title.lastIndexOf(" ");
    var value = lastSpace == -1 ? title : title.substring(0, lastSpace);

    return Container(
      margin: EdgeInsets.fromLTRB(0, 25, 0, 8),
      child: Text(
        value,
        style: TextStyle(
            fontFamily: 'GothamRounded',
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget renderRest() {
    var lastSpace = title.lastIndexOf(" ");
    if (lastSpace == -1) return Container();

    var value = title.substring(lastSpace, title.length);

    return Container(
      margin: EdgeInsets.fromLTRB(7, 25, 0, 0),
      child: Text(
        value,
        style: TextStyle(
            fontFamily: 'GothamRoundedLight',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
