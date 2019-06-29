import 'package:flutter/material.dart';

import './CardItems.dart';

class ItemManager extends StatefulWidget {
  final String startingItem;

  ItemManager(this.startingItem);

  @override
  State<StatefulWidget> createState() {
    return _ItemManagerState();
  }
}

class _ItemManagerState extends State<ItemManager> {
  List<String> _items = [];

  @override
  void initState() {
    _items.add(widget.startingItem);
    super.initState();
  }

  void _additems(String items) {
    setState(() {
      _items.add(items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardItem(_items)
      ]
    );
  }
}
