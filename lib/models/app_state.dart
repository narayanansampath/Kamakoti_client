import 'package:meta/meta.dart';
import 'package:sri_kamakoti/models/post.dart';

@immutable
class AppState {
  final PostListScreenState postListScreenState;
  final SnackState snackState;
  final NavigationState navigationState;

  factory AppState.initial() {
    return AppState(
      postListScreenState: PostListScreenState.initial(),
      snackState: SnackState.initial(),
      navigationState: NavigationState.initial(),
    );
  }

  AppState({
    this.postListScreenState,
    this.snackState,
    this.navigationState,
  });
}

@immutable
class NavigationState {
  final int currentIndex;

  NavigationState({this.currentIndex});

  factory NavigationState.initial() {
    return NavigationState(currentIndex: 0);
  }

  NavigationState copyWith({currentIndex}) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

@immutable
class PostListScreenState {
  final List<Post> posts;
  final bool loading;
  final bool error;

  factory PostListScreenState.initial() {
    return PostListScreenState(posts: [], loading: true, error: false);
  }

  PostListScreenState({this.posts, this.loading, this.error});

  PostListScreenState copyWith({posts, loading, error}) {
    return PostListScreenState(
        posts: posts ?? this.posts,
        loading: loading ?? this.loading,
        error: error ?? this.error);
  }
}

@immutable
class SnackState {
  final String message;
  final String type;
  final bool displayed;

  SnackState({this.message, this.type, this.displayed});

  factory SnackState.initial() {
    return SnackState(message: null, type: null, displayed: true);
  }

  SnackState copyWith({message, type, displayed}) {
    return SnackState(
      message: message ?? this.message,
      type: type ?? this.type,
      displayed: displayed ?? this.displayed,
    );
  }
}
