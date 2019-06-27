import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';

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
          body: Center(
            child: Text(vm.loading ? "Loading..." : vm.posts.first.title),
          ),
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
