import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sri_kamakoti/actions/post_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/ui/containers/snacker.dart';
import 'package:sri_kamakoti/ui/containers/bottom_nav_bar.dart';
import 'package:sri_kamakoti/ui/screens/post_list_screen.dart';
import 'package:sri_kamakoti/ui/screens/about_screen.dart';
import 'package:sri_kamakoti/ui/screens/contact_screen.dart';
import 'package:sri_kamakoti/constants/colors.dart';

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
      StoreProvider.of<AppState>(context).dispatch(FetchPostsAction());
    });
  }

  Widget renderAppBar() {
    return AppBar(
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/adi_shankara.png"),
          Text('Sri Kamakoti',
            style: TextStyle(fontFamily: 'GothamRoundedLight', fontWeight: FontWeight.w600, color: Colors.white),),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return StoreConnector<AppState, _HomeScreenViewModel>(
      converter: (store) => _HomeScreenViewModel.fromStore(store),
      builder: (BuildContext context, _HomeScreenViewModel vm) {
        return Scaffold(
          backgroundColor: kaviColor,
          //appBar: renderAppBar(),
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
