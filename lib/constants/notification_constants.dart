import 'package:sri_kamakoti/constants/strings.dart';
import 'package:sri_kamakoti/models/notification_channel.dart';

/// Contains all the notification channels for the Android app
class NotificationChannels {
  NotificationChannels._();

  static final postChannel = NotificationChannel(
    id: '1',
    name: Strings.post_notification_channel_name,
    description: Strings.post_notification_channel_description,
  );
}