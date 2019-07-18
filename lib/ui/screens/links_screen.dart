import 'package:flutter/material.dart';

import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/data/links_repository.dart';
import 'package:sri_kamakoti/ui/components/link_item.dart';

class LinksScreen extends StatefulWidget {

  @override
  State createState() {
    return LinksScreenState();
  }

}

class LinksScreenState extends State<LinksScreen> {
  List<Post> links;

  void loadLinks() async {
    var links = await LinkRepository().getLinks();
    this.setState(() {
      this.links = links;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLinks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: links == null ? 0 : links.length,
      itemBuilder: (context, index) {
        return LinkItem(links[index], null);
      },
    );
  }
}
