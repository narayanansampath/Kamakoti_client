import 'package:redux/redux.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/constants/app_constants.dart';
import 'package:sri_kamakoti/actions/background_fetch_actions.dart';

Store<AppState> _store;

// background_fetch requires a global level function
void _onFetch() async {
  _store.dispatch(BackgroundFetchAction());

  // TODO: call finish once the work is done
//  BackgroundFetch.finish();
}

class BackgroundFetchHelper {
  BackgroundFetchHelper._();

  static void configureBackgroundFetch(Store<AppState> store) {
    _store = store;
    // Register to receive BackgroundFetch events after app is terminated.
    // Requires {stopOnTerminate: false, enableHeadless: true}
    BackgroundFetch.registerHeadlessTask(_onFetch);

    var config = BackgroundFetchConfig(
      minimumFetchInterval: AppConstants.backgroundFetchInterval,
      stopOnTerminate: false,
      enableHeadless: true,
      forceReload: false,
    );

    BackgroundFetch.configure(config, _onFetch)
        .then((status) => store.dispatch(OnBackgroundFetchSuccess(status)))
        .catchError((e) => store.dispatch(OnBackgroundFetchError(e)));
  }

  static void finishBackgroundFetch() {
    BackgroundFetch.finish();
  }
}
