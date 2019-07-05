import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'logic/reducers.dart';
import 'logic/middlewares.dart';
import 'models/app_state.dart';
import 'screens/home_screen.dart';
import 'ui/kavi_color.dart';

import 'logic/actions.dart';

Future onSelectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: ' + payload);
  }
}

Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
  print(id);
  print(body);
  print(payload);
  print(title);
}

void main() {
  runApp(App());

//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//      new FlutterLocalNotificationsPlugin();
//// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//  var initializationSettingsAndroid =
//      new AndroidInitializationSettings('app_icon');
//  var initializationSettingsIOS = new IOSInitializationSettings(
//      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//  var initializationSettings = new InitializationSettings(
//      initializationSettingsAndroid, initializationSettingsIOS);
//  flutterLocalNotificationsPlugin.initialize(initializationSettings,
//      onSelectNotification: onSelectNotification);
//
//  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//      'your channel id', 'your channel name', 'your channel description',
//      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
//  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//  var platformChannelSpecifics = NotificationDetails(
//      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//  flutterLocalNotificationsPlugin.show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
}

class App extends StatefulWidget {
  final appName = 'Sri Kamakoti';

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
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(AppInitAction());
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
        title: widget.appName,
        home: HomeScreen(),
      ),
    );
  }
}
