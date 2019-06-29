import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';

import './item_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(HomeScreenInitAction());
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) {
        var state = store.state.homeScreenState;
        return HomePageViewModel(posts: state.posts, loading: state.loading);
      },
      builder: (context, HomePageViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            title: Center( child: Text('KAMAKOTI')),
          ),
          body: Column(children: <Widget>[ItemManager(vm.loading ? "Loading..." : vm.posts.first.title)]),
            bottomNavigationBar:BottomNavigationBar(

              currentIndex: _cIndex,
              type: BottomNavigationBarType.shifting ,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.grey[700],
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.contact_mail,
                    color: Colors.grey[700],
                  ),
                  icon: Icon(
                    Icons.contact_mail,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.grey[700],
                  ),
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  ),
                ),
              ],
              onTap: (index){
                _incrementTab(index);

              },
            )
        );
      },
    );
  }
}

class HomePageViewModel {
  final List<Post> posts;
  final bool loading;

  HomePageViewModel({this.posts, this.loading});
}
