class BackgroundFetchAction {}

class OnBackgroundFetchSuccess {
  final int status;

  OnBackgroundFetchSuccess(this.status);
}

class OnBackgroundFetchError {
  final dynamic error;

  OnBackgroundFetchError(this.error);
}
