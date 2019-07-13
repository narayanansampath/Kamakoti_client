import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';

import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/ui/containers/snacker.dart';
import 'package:sri_kamakoti/ui/containers/bottom_nav_bar.dart';
import 'package:sri_kamakoti/ui/screens/post_list_screen.dart';
import 'package:sri_kamakoti/ui/screens/about_screen.dart';
import 'package:sri_kamakoti/ui/screens/contact_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgets = <Widget>[
    PostListScreen(),
    AboutScreen(),
    ContactScreen()
  ];

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
    return StoreConnector<AppState, _HomeScreenViewModel>(
      converter: (store) => _HomeScreenViewModel.fromStore(store),
      builder: (BuildContext context, _HomeScreenViewModel vm) {
        return Scaffold(
          appBar: AppBar(title: Center(child: Text('Sri Kamakoti'))),
          body: Snacker(
            child: widgets.elementAt(vm.currentIndex),
          ),
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}

class _HomeScreenViewModel {
  final int currentIndex;

  _HomeScreenViewModel({this.currentIndex});

  static fromStore(Store<AppState> store) {
    NavigationState navigationState = store.state.navigationState;
    return _HomeScreenViewModel(currentIndex: navigationState.currentIndex);
  }
}
