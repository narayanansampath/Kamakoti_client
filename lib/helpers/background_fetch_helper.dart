import 'package:redux/redux.dart';

import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/constants/app_constants.dart';
import 'package:sri_kamakoti/actions/background_fetch_actions.dart';
import 'package:background_fetch/background_fetch.dart';

class BackgroundFetchHelper {
  BackgroundFetchHelper._();

  static void _onFetch(store) {
    store.dispatch(BackgroundFetchAction());
  }

  static void configureBackgroundFetch(Store<AppState> store) {
    // Register to receive BackgroundFetch events after app is terminated.
    // Requires {stopOnTerminate: false, enableHeadless: true}

    BackgroundFetch.registerHeadlessTask(() => _onFetch(store));

    var config = BackgroundFetchConfig(
      minimumFetchInterval: AppConstants.backgroundInterval,
      stopOnTerminate: false,
      enableHeadless: true,
      forceReload: false,
    );

    BackgroundFetch.configure(config, () => _onFetch(store))
        .then((status) => store.dispatch(OnBackgroundFetchSuccess(status)))
        .catchError((e) => store.dispatch(OnBackgroundFetchError(e)));
  }
}
