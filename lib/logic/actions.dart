import 'package:sri_kamakoti/models/post.dart';

class HomeScreenInitAction {}

class PostRetrievedAction {
  final List<Post> posts;

  PostRetrievedAction(this.posts);
}

class AppInitAction {}