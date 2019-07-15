import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:sri_kamakoti/constants/strings.dart';
import 'package:sri_kamakoti/actions/post_actions.dart';
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
        if (vm.error) {
          return renderError(vm);
        }
        if (vm.loading) {
          return renderLoadingSkeleton();
        }
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

  Widget renderError(_PostListViewModel vm) {
    return Center(
      child: GestureDetector(
        onTap: vm.fetchPosts,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.error_outline, size: 50),
            ),
            Text(Strings.fetch_posts_err_msg),
            Text(Strings.tap_to_retry),
          ],
        ),
      ),
    );
  }
}

class _PostListViewModel {
  final List<Post> posts;
  final bool loading;
  final bool error;
  final Function fetchPosts;

  _PostListViewModel({this.posts, this.loading, this.fetchPosts, this.error});

  static _PostListViewModel fromStore(Store<AppState> store) {
    return _PostListViewModel(
        posts: store.state.postListScreenState.posts,
        loading: store.state.postListScreenState.loading,
        error: store.state.postListScreenState.error,
        fetchPosts: () => store.dispatch(FetchPostsAction()));
  }
}
