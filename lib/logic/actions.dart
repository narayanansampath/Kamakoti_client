import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/models/notification_channel.dart';
import 'package:sri_kamakoti/models/notification.dart';

class HomeScreenInitAction {}

class PostRetrievedAction {
  final List<Post> posts;

  PostRetrievedAction(this.posts);
}

class AppInitAction {}

class ShowNotificationAction {
  final NotificationChannel channel;
  final Notification notification;

  ShowNotificationAction(this.channel, this.notification);
}
