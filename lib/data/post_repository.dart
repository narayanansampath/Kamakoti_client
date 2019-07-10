import 'package:sri_kamakoti/data/network/apis/post_api.dart' as postApi;
import 'package:sri_kamakoti/models/post.dart';

class PostRepository {
  PostRepository._();

  static Future<List<Post>> getPosts() async {
    // implement offline data retrieval logic
    return await postApi.getPosts();
  }

  static Future<List<Post>> getRecentPosts() async {
    // implement offline data retrieval logic
    return await postApi.recentPosts();
  }
}
