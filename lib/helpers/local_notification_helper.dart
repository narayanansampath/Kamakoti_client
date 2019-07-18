import 'package:redux/redux.dart';
import 'package:sri_kamakoti/models/notification_channel.dart';
import 'package:sri_kamakoti/models/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/actions/local_notification_actions.dart';

class LocalNotificationHelper {
  static final _singleton = LocalNotificationHelper._internal();

  factory LocalNotificationHelper() {
    return _singleton;
  }

  LocalNotificationHelper._internal();

  configureLocalNotifications(Store<AppState> store) {
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var initializationSettings = InitializationSettings(
      AndroidInitializationSettings('app_icon'),
      IOSInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        store.dispatch(OnSelectNotification(payload));
      },
    );
  }

  Future showNotification(
    NotificationChannel channel,
    Notification notification,
  ) async {
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channel.description,
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.description ?? "", // app crashes in iOS if null
      platformChannelSpecifics,
      payload: notification.payload,
    );
  }
}
