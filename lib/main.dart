import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'models/app_state.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/logic/reducers.dart';
import 'package:sri_kamakoti/logic/middlewares.dart';
import 'package:sri_kamakoti/ui/home/home_screen.dart';
import 'package:sri_kamakoti/constants/colors.dart';
import 'package:sri_kamakoti/constants/strings.dart';

Future onDidReceiveLocalNotification(
  int id,
  String title,
  String body,
  String payload,
) async {
  print(id);
  print(body);
  print(payload);
  print(title);
}

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  final store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
    middleware: [middleware, LoggingMiddleware.printer()],
  );

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.store.dispatch(AppInitAction());

    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var initializationSettings = InitializationSettings(
      AndroidInitializationSettings('app_icon'),
      IOSInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: kaviColor,
            accentColor: Color(0xfffe9322)),
        title: Strings.appName,
        home: HomeScreen(),
      ),
    );
  }
}
