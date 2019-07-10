import 'package:redux/redux.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/data/post_repository.dart';

middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is HomeScreenInitAction) {
    _handleHomeScreenInit(store, action);
  } else if (action is AppInitAction) {
    _handleAppInit(store, action);
  }
  next(action);
}

_handleHomeScreenInit(Store<AppState> store, HomeScreenInitAction action) {
  getPosts().then((posts) => posts.toList()).then((posts) {
    store.dispatch(PostRetrievedAction(posts));
  });
}

Future _showNotificationWithDefaultSound() async {
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'New Post',
    'How to Show Notification in Flutter',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

// This "Headless Task" is run when android app is terminated.
void backgroundFetchCallback() async {
  print('[BackgroundFetch] Headless event received.');
  _showNotificationWithDefaultSound();

//  var posts = await recentPosts();
//  print(posts);

  BackgroundFetch.finish();
}

_handleAppInit(store, action) {
  _showNotificationWithDefaultSound();
  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchCallback);

  var config = BackgroundFetchConfig(
      minimumFetchInterval: 15,
      stopOnTerminate: false,
      enableHeadless: true,
      forceReload: false);

  BackgroundFetch.configure(config, backgroundFetchCallback).then((int status) {
    print('[BackgroundFetch] SUCCESS: $status');
  }).catchError((e) {
    print('[BackgroundFetch] ERROR: $e');
  });
}
