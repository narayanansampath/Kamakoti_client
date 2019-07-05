class Post {
  String id;
  String title;
  String caption;
  String url;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Post(
      {this.id,
      this.title,
      this.caption,
      this.url,
      this.image,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    caption = json['caption'];
    image = json['image'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
