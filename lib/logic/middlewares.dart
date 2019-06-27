import 'package:redux/redux.dart';
import 'package:sri_kamakoti/logic/actions.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';

middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is HomeScreenInitAction) {
    _handleHomeScreenInit(store, action, next);
  }
  next(action);
}

_handleHomeScreenInit(Store<AppState> store,
                      HomeScreenInitAction action,
                      NextDispatcher next) {
  List<Post> posts = List<Post>();
  posts.add(Post(
      description:
          "Sri Adi Sankara had set up the Shri Kanchi Kamakoti Peetham in 482 B.C.",
      image: "http://www.kamakoti.org/assets/images/kamakoti/scroller/hh2.jpg",
      title: "Sri Adi Sankara",
      url:
          "http://www.kamakoti.org/kamakoti/details/Adi%20Sankara%20Focus.html"));

  posts.add(Post(
      description:
          "The Shri Kanchi Kamakoti Peetham has a unique distinction of an unbroken lineage of 70 Shankaracharyas",
      image: "http://www.kamakoti.org/assets/images/kamakoti/scroller/hh2.jpg",
      title: "Sri Adi Sankara",
      url:
          "http://www.kamakoti.org/kamakoti/details/Adi%20Sankara%20Focus.html"));

  posts.add(Post(
      description:
          "Sri Adi Sankara had set up the Shri Kanchi Kamakoti Peetham in 482 B.C.",
      image: "http://www.kamakoti.org/assets/images/kamakoti/scroller/hh6.jpg",
      title: "Guru Parampara",
      url: "http://www.kamakoti.org/peeth/origin.html"));

  var future = Future.delayed(
    Duration(seconds: 3),
    () => store.dispatch(PostRetrievedAction(posts)),
  );
}
