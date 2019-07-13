import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/ui/containers/post_list.dart';
import 'package:sri_kamakoti/ui/containers/snacker.dart';

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
    return StoreConnector<AppState, _HomePageViewModel>(
      converter: (store) => _HomePageViewModel.fromStore(store),
      builder: (context, _HomePageViewModel vm) {
        return Scaffold(
          appBar: AppBar(title: Center(child: Text('Sri Kamakoti'))),
          body: Snacker(vm.loading ? renderLoading() : PostList()),
          bottomNavigationBar: renderBottomNavigationBar(),
        );
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

  Widget renderLoading() {
    return PKCardListSkeleton(
      isCircularImage: false,
      isBottomLinesActive: true,
      length: 4,
    );
  }
}

class _HomePageViewModel {
  final List<Post> posts;
  final bool loading;

  _HomePageViewModel({this.posts, this.loading});

  static _HomePageViewModel fromStore(Store<AppState> store) {
    return _HomePageViewModel(
        posts: store.state.homeScreenState.posts,
        loading: store.state.homeScreenState.loading);
  }
}
