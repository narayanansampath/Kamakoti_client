import 'package:dio/dio.dart';

import 'package:sri_kamakoti/data/network/endpoints.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/models/api_response.dart';

Future<List<Post>> getPosts() async {
  try {
    Response response = await Dio().get(Endpoints.getPosts);

    var responseData = ApiResponse.fromJson(response.data);
    if (!responseData.isSuccessful) throw "Error fetching posts";

    return (responseData.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  } catch (e) {
    throw e;
  }
}

Future<List<Post>> recentPosts() async {
  try {
    Response response = await Dio().get(Endpoints.recentPosts);

    var responseData = ApiResponse.fromJson(response.data);
    if (!responseData.isSuccessful) throw "Error fetching posts";

    return (responseData.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  } catch (e) {
    throw e;
  }
}
