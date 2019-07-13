import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  State createState() {
    return _ContactScreenState();
  }
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contact us"));
  }
}
