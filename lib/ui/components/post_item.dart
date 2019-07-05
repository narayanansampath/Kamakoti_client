import 'package:flutter/material.dart';

import 'package:sri_kamakoti/models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final height = 250.0;
  final gradientHeight = 150.0;

  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    Widget renderTexts() {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(post.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey.shade400)),
          ],
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(post.image),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/black_gradient.png",
              height: gradientHeight,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: renderTexts(),
          ),
        ],
      ),
    );
  }
}
