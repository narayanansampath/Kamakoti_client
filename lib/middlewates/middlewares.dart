import 'package:redux/redux.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:sri_kamakoti/actions/local_notification_actions.dart';
import 'package:sri_kamakoti/actions/post_actions.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/actions/background_fetch_actions.dart';
import 'package:sri_kamakoti/constants/strings.dart';
import 'package:sri_kamakoti/constants/colors.dart';
import 'package:sri_kamakoti/constants/notification_constants.dart';
import 'package:sri_kamakoti/models/app_state.dart';
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
  } else if (action is OnSelectNotification) {
    _handleOnSelectNotification(store, action);
  } else if (action is FinishBackgroundFetchAction) {
    _handleFinishBackgroundFetch(store, action);
  } else if (action is OpenLinkAction) {
    _handleOpenLinkAction(store, action);
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
  try {
    var posts = await PostRepository().getPosts();
    Future.delayed(Duration(seconds: 2), () {
      store.dispatch(PostRetrievedAction(posts));
    });
  } catch (e) {
    store.dispatch(ShowSnackAction(
      type: "error",
      message: Strings.fetch_posts_err_msg,
    ));
  }
}

_handleBackgroundFetch(Store<AppState> store, action) async {
  var posts = await PostRepository().getRecentPosts();

  if (posts.length <= 0) return;

  posts.forEach((p) {
    var notification = Notification(
      id: p.id,
      title: Strings.latest_post,
      description: p.title,
      payload: p.url,
    );
    var notificationAction = ShowNotificationAction(
      NotificationChannels.postChannel,
      notification,
    );
    store.dispatch(notificationAction);

    // since we don't know when the notifications are displayed
    // mark that the background is finished after an arbitrary time
    Future.delayed(
      Duration(seconds: 1),
      () => store.dispatch(FinishBackgroundFetchAction()),
    );
  });
}

_handleShowNotification(store, ShowNotificationAction action) async {
  await LocalNotificationHelper().showNotification(
    action.channel,
    action.notification,
  );
}

_handleFinishBackgroundFetch(store, action) {
  BackgroundFetchHelper.finishBackgroundFetch();
}

_handleOpenLinkAction(Store<AppState> store, OpenLinkAction action) async {
  try {
    launch(
      action.url,
      option: CustomTabsOption(
        // should find a better way to get the theme primary color
        toolbarColor: kaviColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsAnimation(
          startEnter: 'slide_up',
          endEnter: 'slide_down',
        ),
      ),
    );
  } catch (e) {
    print(e);
    store.dispatch(ShowSnackAction(
      type: "error",
      message: Strings.url_open_err_msg,
    ));
  }
}

/// Assuming that the payload is always an url open the url.
/// Should be reimplemented when notifications needs to be handled differently.
_handleOnSelectNotification(
  Store<AppState> store,
  OnSelectNotification action,
) {
  store.dispatch(OpenLinkAction(url: action.payload));
}
