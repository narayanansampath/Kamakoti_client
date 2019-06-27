import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/logic/reducers.dart';
import 'package:sri_kamakoti/logic/middlewares.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/screens/home_screen.dart';

void main() {
  runApp(App());
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
