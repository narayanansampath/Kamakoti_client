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

  factory PostListScreenState.initial() {
    return PostListScreenState(posts: [], loading: true);
  }

  PostListScreenState({this.posts, this.loading});

  PostListScreenState copyWith({posts, loading}) {
    return PostListScreenState(
      posts: posts ?? this.posts,
      loading: loading ?? this.loading,
    );
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
