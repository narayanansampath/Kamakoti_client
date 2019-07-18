import 'package:flutter/material.dart';
import 'package:sri_kamakoti/models/post.dart';

class LinkItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  final height = 200.0;
  final gradientHeight = 150.0;

  LinkItem(this.post, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Image.network(
              post.image,
              height: height,
              fit: BoxFit.cover,
            ),
            Text(post.title)
          ],
        ));
  }
}
