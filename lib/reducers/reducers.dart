import 'package:sri_kamakoti/actions/post_actions.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/actions/navigation_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  return AppState(
    navigationState: _reduceNavigationState(state, action),
    postListScreenState: _reducePostListScreenState(state, action),
    snackState: _reduceSnackState(state, action),
  );
}

NavigationState _reduceNavigationState(AppState state, action) {
  NavigationState navigationState = state.navigationState;
  if (action is NavigateToIndexAction) {
    return navigationState.copyWith(currentIndex: action.index);
  }
  return navigationState;
}

PostListScreenState _reducePostListScreenState(AppState state, action) {
  PostListScreenState postListScreenState = state.postListScreenState;
  if (action is FetchPostsAction) {
    postListScreenState = postListScreenState.copyWith(
      loading: true,
      error: false,
    );
  }
  if (action is FetchPostsSuccessAction) {
    postListScreenState = postListScreenState.copyWith(
      loading: false,
      posts: action.posts,
    );
  } else if (action is FetchPostsErrorAction) {
    postListScreenState =
        postListScreenState.copyWith(loading: false, error: true);
  }
  return postListScreenState;
}

SnackState _reduceSnackState(AppState state, action) {
  SnackState snackState = state.snackState;
  if (action is ShowSnackAction) {
    return snackState.copyWith(
      message: action.message,
      type: action.type,
      displayed: false,
    );
  } else if (action is ShowSnackCompletedAction) {
    return snackState.copyWith(message: null, type: null, displayed: true);
  }
  return snackState;
}
