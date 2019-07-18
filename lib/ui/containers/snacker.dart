import "package:flutter/material.dart";
import "package:redux/redux.dart";
import "package:flutter_redux/flutter_redux.dart";
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/actions/actions.dart';

class Snacker extends StatelessWidget {
  final Widget child;

  Snacker({this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _SnackerViewModel>(
      converter: (store) => _SnackerViewModel.fromStore(store),
      builder: (context, _SnackerViewModel vm) => child,
      distinct: true,
      onWillChange: (vm) {
        if (vm.snackToShow == null) return;
        Scaffold.of(context).showSnackBar(vm.snackToShow);
        vm.setShowToastSuccessful();
      },
    );
  }
}

class _SnackerViewModel {
  final Function setShowToastSuccessful;
  final SnackBar snackToShow;

  _SnackerViewModel({this.setShowToastSuccessful, this.snackToShow});

  static SnackBar getSnackBar(SnackState snackState) {
    if (snackState.displayed) return null;

    var color = snackState.type == "error"
        ? Colors.red
        : (snackState.type == "success" ? Colors.green : null);

    return SnackBar(content: Text(snackState.message), backgroundColor: color);
  }

  static _SnackerViewModel fromStore(Store<AppState> store) {
    SnackState snackState = store.state.snackState;
    return _SnackerViewModel(
      setShowToastSuccessful: () => store.dispatch(ShowSnackCompletedAction()),
      snackToShow: getSnackBar(snackState),
    );
  }

  @override
  int get hashCode => snackToShow.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _SnackerViewModel && other.snackToShow == this.snackToShow;
}
