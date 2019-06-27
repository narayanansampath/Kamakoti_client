import 'package:meta/meta.dart';
import 'package:sri_kamakoti/models/post.dart';

@immutable
class AppState {
  final HomeScreenState homeScreenState;

  factory AppState.initial() {
    return AppState(
        homeScreenState: HomeScreenState.initial()
    );
  }

  AppState({this.homeScreenState});
}

@immutable
class HomeScreenState {
  final List<Post> posts;
  final bool loading;

  factory HomeScreenState.initial() {
    return HomeScreenState(
        posts: [],
        loading: true
    );
  }

  HomeScreenState({this.posts, this.loading});

  HomeScreenState copyWith({posts, loading}) {
    return HomeScreenState(
      posts: posts ?? this.posts,
      loading: loading ?? this.loading,
    );
  }
}
