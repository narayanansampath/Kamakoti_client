/// holds generic app actions

class AppInitAction {}

class HomeScreenInitAction {}

class OpenLinkAction {
  final String title;
  final String url;

  OpenLinkAction({this.title, this.url});
}