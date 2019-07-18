import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/util.dart';

class LinkRepository {
  static final LinkRepository _singleton = LinkRepository._internal();

  factory LinkRepository() {
    return _singleton;
  }

  LinkRepository._internal();

  Future<List<Post>> getLinks() async {
    var json = await parseJsonFromAssets('assets/related_links.json');
    return json.map((item) => Post.fromJson(item)).toList();
  }

}
