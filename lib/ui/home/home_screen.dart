import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/ui/home/widgets/post_item.dart';

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
    // accessing inherited widget before initState finishes throw
    // exception so delay it.
    Future.delayed(Duration(milliseconds: 100), () {
      StoreProvider.of<AppState>(context).dispatch(HomeScreenInitAction());
    });
  }

  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) {
        var state = store.state.homeScreenState;
        return HomePageViewModel(posts: state.posts, loading: state.loading);
      },
      builder: (context, HomePageViewModel vm) {
        return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Sri Kamakoti')),
            ),
            body: ListView.builder(
              itemCount: vm.posts.length,
              itemBuilder: (context, index) {
                return PostItem(vm.posts[index]);
              },
            ),
            bottomNavigationBar: renderBottomNavigationBar());
      },
    );
  }

  Widget renderBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.shifting,
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
            style: TextStyle(color: Colors.grey[600]),
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
            style: TextStyle(color: Colors.grey[600]),
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
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
      onTap: (index) {
        _incrementTab(index);
      },
    );
  }
}

class HomePageViewModel {
  final List<Post> posts;
  final bool loading;

  HomePageViewModel({this.posts, this.loading});
}
