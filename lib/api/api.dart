import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/util.dart';

String get apiRoot {
  if (isDebugMode) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return "http://localhost:8000/api/v1/";
    } else {
      return "http://10.0.2.2:8000/api/v1/";
    }
  } else {
    // return actual api
    return "http://www.example.com/";
  }
}

bool isSuccess(http.Response response) {
  if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
    return false;
  }
  var decoded = json.decode(response.body);
  if (decoded['status'] != 'success') {
    return false;
  }
  return true;
}

Future<List<Post>> fetchPosts() async {
  var url = apiRoot + "posts";

  var response = await http.get(url);

  if (!isSuccess(response)) {
    throw Exception("Failed to fetch posts");
  }

  var decoded = json.decode(response.body);
  return (decoded['data'] as List)
      .map((json) => Post.fromJson(json))
      .toList();
}
