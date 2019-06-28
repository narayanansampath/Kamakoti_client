import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:http/http.dart' as http;

import 'package:sri_kamakoti/logic/reducers.dart';
import 'package:sri_kamakoti/logic/middlewares.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/screens/home_screen.dart';
import 'package:background_fetch/background_fetch.dart';

const EVENTS_KEY = "fetch_events";

/// This "Headless Task" is run when app is terminated.
void backgroundFetchHeadlessTask() async {
  print('[BackgroundFetch] Headless event received.');

  var apiUrl =
      "https://us-central1-srikamakoti-822a3.cloudfunctions.net/addMessage?text=" +
          DateTime.now().toString();
  await http.get(apiUrl);

  BackgroundFetch.finish();
}

void main() {
  runApp(App());

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class App extends StatelessWidget {
  final appName = 'Sri Kamakoti';

  final store = Store<AppState>(
    (state, action) {
      return reducer(state, action);
    },
    initialState: AppState.initial(),
    middleware: [middleware, LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    BackgroundFetch.configure(
            BackgroundFetchConfig(
                minimumFetchInterval: 15,
                stopOnTerminate: false,
                enableHeadless: true,
                forceReload: false),
            backgroundFetchHeadlessTask)
        .then((int status) {
      print('[BackgroundFetch] SUCCESS: $status');
    }).catchError((e) {
      print('[BackgroundFetch] ERROR: $e');
    });

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(accentColor: Colors.orangeAccent),
        title: appName,
        home: HomeScreen(),
      ),
    );
  }
}
