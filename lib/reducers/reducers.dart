import 'package:sri_kamakoti/actions/post_actions.dart';
import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  return AppState(
      homeScreenState: _reduceHomeScreenState(state, action),
      snackState: _reduceSnackState(state, action));
}

HomeScreenState _reduceHomeScreenState(AppState state, action) {
  HomeScreenState homeScreenState = state.homeScreenState;
  if (action is PostRetrievedAction) {
    homeScreenState = homeScreenState.copyWith(
      loading: false,
      posts: action.posts,
    );
  }
  return homeScreenState;
}

SnackState _reduceSnackState(AppState state, action) {
  SnackState snackState = state.snackState;
  if (action is ShowSnackAction) {
    return snackState.copyWith(
      message: action.message,
      type: action.type,
      displayed: false,
    );
  } else if (action is ShowSnackSuccessAction) {
    return snackState.copyWith(message: null, type: null, displayed: true);
  }
  return snackState;
}
