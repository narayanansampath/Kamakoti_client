import 'package:flutter/material.dart';
import 'package:sri_kamakoti/constants/colors.dart';
import 'package:sri_kamakoti/models/post.dart';

class LinkItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  final height = 100.0;

  LinkItem(this.post, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        child: Card(
          color: kaviColor[300],
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: <Widget>[
              Image.network(
                post.image,
                height: height,
                width: height,
                fit: BoxFit.cover,
              ),
              renderTexts(context)
            ],
          ),
        ),
      ),
    );
  }

  renderTexts(context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            post.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
          renderLink()
        ],
      ),
    );
  }

  renderLink() {
    return Row(
      children: <Widget>[
        Padding(
          child: Icon(Icons.link, color: Colors.blue),
          padding: EdgeInsets.only(right: 5),
        ),
        Text(
          post.url,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
