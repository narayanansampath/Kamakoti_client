import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/ui/components/post_item.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ListView.builder(
          itemCount: vm.posts.length,
          itemBuilder: (context, index) {
            var post = vm.posts[index];
            return PostItem(
              post,
              () {
                launch(
                  post.url,
                  option: CustomTabsOption(
                    toolbarColor: Theme.of(context).primaryColor,
                    enableDefaultShare: true,
                    enableUrlBarHiding: true,
                    showPageTitle: true,
                    animation: CustomTabsAnimation(
                        startEnter: 'slide_up',
                        endEnter: 'slide_down'),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _ViewModel {
  final List<Post> posts;

  _ViewModel({this.posts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(posts: store.state.homeScreenState.posts);
  }
}
