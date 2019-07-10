import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:sri_kamakoti/util.dart';

class Endpoints {
  Endpoints._();

  static String get baseUrl {
    if (isDebugMode) {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return "http://localhost:8000/v1/";
      } else {
//      return "http://192.168.43.84:8000/v1/";
        return "http://10.0.2.2:8000/v1/";
      }
    } else {
      // TODO: return actual api
      return "http://www.example.com/";
    }
  }

  static final getPosts = baseUrl + "posts";

  static final recentPosts = baseUrl + "posts/recent";
}
