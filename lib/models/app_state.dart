import 'package:meta/meta.dart';
import 'package:sri_kamakoti/models/post.dart';

@immutable
class AppState {
  final HomeScreenState homeScreenState;
  final SnackState snackState;

  factory AppState.initial() {
    return AppState(
      homeScreenState: HomeScreenState.initial(),
      snackState: SnackState.initial(),
    );
  }

  AppState({this.homeScreenState, this.snackState});
}

@immutable
class HomeScreenState {
  final List<Post> posts;
  final bool loading;

  factory HomeScreenState.initial() {
    return HomeScreenState(posts: [], loading: true);
  }

  HomeScreenState({this.posts, this.loading});

  HomeScreenState copyWith({posts, loading}) {
    return HomeScreenState(
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
