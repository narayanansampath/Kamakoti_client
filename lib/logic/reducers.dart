import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';


AppState reducer(AppState state, dynamic action) {
  return AppState(
    homeScreenState: _reduceHomeScreenState(state, action),
  );
}

HomeScreenState _reduceHomeScreenState(AppState state, action) {
  HomeScreenState homeScreenState = state.homeScreenState;
  if (action is PostRetrievedAction) {
    homeScreenState = homeScreenState.copyWith(loading: false, posts: action.posts);
  }
  return homeScreenState;
}
