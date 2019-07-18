import 'package:sri_kamakoti/models/notification_channel.dart';
import 'package:sri_kamakoti/models/notification.dart';

class OnSelectNotification {
  final String payload;

  OnSelectNotification(this.payload);
}

class ShowNotificationAction {
  final NotificationChannel channel;
  final Notification notification;

  ShowNotificationAction(this.channel, this.notification);
}
