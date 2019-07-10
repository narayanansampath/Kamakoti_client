import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/models/notification_channel.dart';

class HomeScreenInitAction {}

class PostRetrievedAction {
  final List<Post> posts;

  PostRetrievedAction(this.posts);
}

class AppInitAction {}

class ShowNotificationAction {
  final NotificationChannel channel;
  final dynamic payload;

  ShowNotificationAction(this.channel, this.payload);
}
