import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/actions/navigation_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  var backgroundColor = kaviColor;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _BottomNavBarViewModel>(
      converter: (store) => _BottomNavBarViewModel.formStore(store),
      builder: (BuildContext context, _BottomNavBarViewModel vm) {
        return BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: kaviColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts),
                title: Text('Posts'),
                backgroundColor: backgroundColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.link),
                title: Text('Links'),
                backgroundColor: backgroundColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                title: Text('About'),
                backgroundColor: backgroundColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone),
                title: Text('Contact'),
                backgroundColor: backgroundColor),
          ],
          currentIndex: vm.index,
          selectedItemColor: Colors.white,
          onTap: vm.onTapNewRoute,
        );
      },
    );
  }
}

class _BottomNavBarViewModel {
  final int index;
  final Function onTapNewRoute;

  _BottomNavBarViewModel({this.index, this.onTapNewRoute});

  factory _BottomNavBarViewModel.formStore(Store<AppState> store) {
    NavigationState navigationState = store.state.navigationState;
    return _BottomNavBarViewModel(
        index: navigationState.currentIndex,
        onTapNewRoute: (index) {
          store.dispatch(NavigateToIndexAction(index: index));
        });
  }
}
