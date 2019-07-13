import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/ui/containers/post_list.dart';

class PostListScreen extends StatefulWidget {
  @override
  State createState() {
    return _PostListScreenState();
  }
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PostListViewModel>(
      converter: (store) => _PostListViewModel.fromStore(store),
      builder: (context, _PostListViewModel vm) {
        return vm.loading ? renderLoadingSkeleton() : PostList();
      },
    );
  }

  Widget renderLoadingSkeleton() {
    return PKCardListSkeleton(
      isCircularImage: false,
      isBottomLinesActive: true,
      length: 4,
    );
  }
}

class _PostListViewModel {
  final List<Post> posts;
  final bool loading;

  _PostListViewModel({this.posts, this.loading});

  static _PostListViewModel fromStore(Store<AppState> store) {
    return _PostListViewModel(
      posts: store.state.postListScreenState.posts,
      loading: store.state.postListScreenState.loading,
    );
  }
}
