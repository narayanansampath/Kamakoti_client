/// holds generic app actions

class AppInitAction {}

class OpenLinkAction {
  final String title;
  final String url;

  OpenLinkAction({this.title, this.url});
}

class ShowSnackAction {
  final String type;
  final String message;

  ShowSnackAction({this.type, this.message});
}

class ShowSnackCompletedAction {}
