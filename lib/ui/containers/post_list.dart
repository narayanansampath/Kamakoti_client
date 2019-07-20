import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/actions/post_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/ui/components/post_item.dart';

class PostList extends StatefulWidget {
  @override
  State createState() {
    return PostListState();
  }
}

class PostListState extends State<PostList> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

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
              () => vm.onTap(post),
            );
          },
          controller: _controller,
        );
      },
    );
  }

  void _onScroll() {
    // only 500px are below, now is a good tme to fetch next set of records
    if (_controller.position.extentAfter < 500) {
      var store = StoreProvider.of<AppState>(context);
      var postListState = store.state.postListScreenState;
      if (!postListState.loadingMore) {
        store.dispatch(FetchMorePostsAction());
      }
    }
  }
}

class _ViewModel {
  final List<Post> posts;
  final Function(Post) onTap;
  final Function fetchPosts;

  _ViewModel({this.posts, this.onTap, this.fetchPosts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        posts: store.state.postListScreenState.posts,
        onTap: (post) {
          store.dispatch(OpenLinkAction(title: post.title, url: post.url));
        },
        fetchPosts: () => store.dispatch(FetchPostsAction()));
  }
}
