import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/ui/containers/snacker.dart';
import 'package:sri_kamakoti/ui/screens/post_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // accessing inherited widget before initState finishes throw
    // exception so delay it.
    Future.delayed(Duration(milliseconds: 100), () {
      StoreProvider.of<AppState>(context).dispatch(HomeScreenInitAction());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Sri Kamakoti'))),
      body: Snacker(
        child: PostListScreen(),
      ),
    );
  }
}
