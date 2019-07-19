import 'package:sri_kamakoti/models/post.dart';

class FetchPostsAction {}

class FetchPostsSuccessAction {
  final List<Post> posts;

  FetchPostsSuccessAction(this.posts);
}

class FetchMorePostsAction {}

class FetchPostsErrorAction {}
