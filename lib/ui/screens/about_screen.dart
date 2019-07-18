import 'package:flutter/material.dart';
import 'package:sri_kamakoti/constants/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  State createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: kaviColor,
        body: SafeArea(child: Center(child: Text("About us"))));
  }
}
