import 'package:flutter/material.dart';
import 'package:gitapp/users_list/searchbar_widget.dart';
import 'package:gitapp/users_list/connection_presenter.dart';
import 'package:gitapp/users_list/user_cards_widget.dart';
import 'package:gitapp/users_list/users_presenter.dart';
import 'liked_users_home_widget.dart';
import 'no_connection_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final UsersPresenter users = UsersPresenter();
  late Searchbar searchBar = new Searchbar(getUsers);
  bool connectionStatus = true;
  bool searching = false;

  Future getUsers(String text) async {
    connectionStatus = await Connection.instance.checkConnection();
    setState(() {});
    if (text != "" || !connectionStatus) {
      setState(() {
        searching = true;
      });
      await users.updateSearchedListFromApi(text);
      setState(() {
        searchBar.textController.clear();
        searching = false;
      });
    } else
      users.searchedList.clear();
  }

  Widget chooseWidget() {
    if (!connectionStatus) {
      return Center(
        child: NetworkErrorView(
            message: 'No Internet Connection.\nMind Trying again?'),
      );
    } else if (searching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return UserCards(users: users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(children: <Widget>[
          LikeUsersHomeWidget(),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: searchBar,
          ),
          Divider(height: 2.0),
          Flexible(child: chooseWidget()),
        ]),
      ),
    );
  }
}