import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  State createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("About us"));
  }
}
