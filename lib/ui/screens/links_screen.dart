import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:sri_kamakoti/actions/actions.dart';
import 'package:sri_kamakoti/constants/colors.dart';
import 'package:sri_kamakoti/models/app_state.dart';
import 'package:sri_kamakoti/models/post.dart';
import 'package:sri_kamakoti/data/links_repository.dart';
import 'package:sri_kamakoti/ui/components/cool_title.dart';
import 'package:sri_kamakoti/ui/components/link_item.dart';

class LinksScreen extends StatefulWidget {
  @override
  State createState() {
    return LinksScreenState();
  }
}

class LinksScreenState extends State<LinksScreen> {
  List<Post> links;

  void loadLinks() async {
    var links = await LinkRepository().getLinks();
    // should handle via redux
    this.setState(() {
      this.links = links;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLinks();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _LinksScreenViewModel>(
      converter: (store) => _LinksScreenViewModel.fromStore(store),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(title: CoolTitle("RELATED LINKS"), elevation: 0),
          backgroundColor: kaviColor,
          body: renderList(vm),
        );
      },
    );
  }

  renderList(vm) {
    return ListView.builder(
      itemCount: links == null ? 0 : links.length,
      itemBuilder: (context, index) {
        var link = links[index];
        return LinkItem(link, () => vm.onTap(link.url));
      },
    );
  }
}

class _LinksScreenViewModel {
  final Function(String) onTap;

  _LinksScreenViewModel({this.onTap});

  static fromStore(Store<AppState> store) {
    return _LinksScreenViewModel(onTap: (String url) {
      store.dispatch(OpenLinkAction(url: url, title: ""));
    });
  }
}
