import 'package:redux/redux.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/actions/background_fetch_actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/constants/notification_channels.dart';
import 'package:sri_kamakoti/models/notification.dart';
import 'package:sri_kamakoti/data/post_repository.dart';
import 'package:sri_kamakoti/helpers/background_fetch_helper.dart';
import 'package:sri_kamakoti/helpers/local_notification_helper.dart';

middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is HomeScreenInitAction) {
    _handleHomeScreenInit(store, action);
  } else if (action is AppInitAction) {
    _handleAppInit(store, action);
  } else if (action is BackgroundFetchAction) {
    _handleBackgroundFetch(store, action);
  } else if (action is ShowNotificationAction) {
    _handleShowNotification(store, action);
  }
  next(action);
}

_handleAppInit(store, action) {
  BackgroundFetchHelper.configureBackgroundFetch(store);
  LocalNotificationHelper().configureLocalNotifications(store);
}

_handleHomeScreenInit(
  Store<AppState> store,
  HomeScreenInitAction action,
) async {
  var posts = await PostRepository().getPosts();
  store.dispatch(PostRetrievedAction(posts));
}

_handleBackgroundFetch(Store<AppState> store, action) async {
  var posts = await PostRepository().getRecentPosts();
  if (posts.length <= 0) return;

  posts.forEach((p) {
    var notification = Notification(
      id: p.id,
      title: p.title,
      payload: p.url,
    );
    var notificationAction = ShowNotificationAction(
      NotificationChannels.postChannel,
      notification,
    );
    store.dispatch(notificationAction);
  });
}

_handleShowNotification(store, ShowNotificationAction action) {
  LocalNotificationHelper().showNotification(
    action.channel,
    action.notification,
  );
}
