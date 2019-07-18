import 'package:sri_kamakoti/data/network/apis/post_api.dart' as postApi;
import 'package:sri_kamakoti/models/post.dart';

class PostRepository {
  static final PostRepository _singleton = new PostRepository._internal();

  factory PostRepository() {
    return _singleton;
  }

  PostRepository._internal();

  Future<List<Post>> getPosts() async {
    // implement offline data retrieval logic
    return await postApi.getPosts();
  }

  Future<List<Post>> getRecentPosts() async {
    // implement offline data retrieval logic
    return await postApi.recentPosts();
  }
}
