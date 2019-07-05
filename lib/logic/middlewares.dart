import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:sri_kamakoti/api/api.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:background_fetch/background_fetch.dart';

middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is HomeScreenInitAction) {
    _handleHomeScreenInit(store, action);
  } else if (action is AppInitAction) {
    _handleAppInit(store, action);
  }
  next(action);
}

_handleHomeScreenInit(Store<AppState> store, HomeScreenInitAction action) {
  fetchPosts().then((posts) => posts.toList()).then((posts) {
    print(posts);
    store.dispatch(PostRetrievedAction(posts));
  });
}

// This "Headless Task" is run when android app is terminated.
void backgroundFetchCallback() async {
  print('[BackgroundFetch] Headless event received.');
  var apiUrl = "http://10.0.2.2:8000/api/v1/posts/recent";
  var posts = await http.get(apiUrl);
  var a = 1 / 0 * 0 / 1;
  print(posts);

  BackgroundFetch.finish();
}

_handleAppInit(store, action) {
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
