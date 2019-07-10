import 'package:redux/redux.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/notification_channel.dart';
import 'package:sri_kamakoti/models/notification.dart';
import 'package:sri_kamakoti/data/post_repository.dart';
import 'package:sri_kamakoti/helpers/background_fetch_helper.dart';

middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is HomeScreenInitAction) {
    _handleHomeScreenInit(store, action);
  } else if (action is AppInitAction) {
    _handleAppInit(store, action);
  }
  next(action);
}

_handleHomeScreenInit(
  Store<AppState> store,
  HomeScreenInitAction action,
) async {
  var posts = await PostRepository.getPosts();
  store.dispatch(PostRetrievedAction(posts));
}

Future _showNotification(
    NotificationChannel channel, Notification notification) async {
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
    notification.description,
    platformChannelSpecifics,
    payload: notification.payload,
  );
}

_handleAppInit(store, action) {
  BackgroundFetchHelper.configureBackgroundFetch(store);
}
