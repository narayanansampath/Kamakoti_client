import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/actions/navigation_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _BottomNavBarViewModel>(
      converter: (store) => _BottomNavBarViewModel.formStore(store),
      builder: (BuildContext context, _BottomNavBarViewModel vm) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts),
              title: Text('Posts'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.link),
              title: Text('Links'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              title: Text('About'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Contact'),
            ),
          ],
          currentIndex: vm.index,
          selectedItemColor: Theme.of(context).primaryColor,
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
