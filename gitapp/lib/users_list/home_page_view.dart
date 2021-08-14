import 'package:flutter/material.dart';
import 'package:gitapp/constants/states.dart';
import 'package:gitapp/users_list/searchbar_widget.dart';
import 'package:gitapp/users_list/user_cards_widget.dart';
import 'package:gitapp/users_list/users_presenter.dart';
import 'no_connection_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Searchbar searchBar = new Searchbar(getUsers);
  AppState appState = AppState.updated;

  Future getUsers(String text) async {
    setState(() {});
    if (text != "") {
      setState(() {
        appState = AppState.searching;
      });
      appState = await UsersPresenter.presenter.updateSearchedListFromApi(text);
      setState(() {});
    } else {
      setState(() {
        appState = AppState.updated;
        UsersPresenter.presenter.clearSearchList();
      });
    }
  }

  Widget chooseWidgetBasedOnState() {
    switch (appState) {
      case AppState.updated:
        return UserCards(users: UsersPresenter.presenter);
      case AppState.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case AppState.noConnection:
        return Center(
          child: NetworkErrorView(
              message: 'No Internet Connection.\nMind Trying again?'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: searchBar,
          ),
          Divider(height: 2.0),
          Flexible(child: chooseWidgetBasedOnState()),
        ]),
      ),
    );
  }
}
