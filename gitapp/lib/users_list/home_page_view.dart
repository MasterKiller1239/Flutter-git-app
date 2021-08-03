import 'package:flutter/material.dart';
import 'package:gitapp/users_list/searchbar_widget.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/users_list/connection_presenter.dart';
import 'package:gitapp/users_list/user_card_widget.dart';
import 'package:gitapp/users_list/users_list_presenter.dart';
import 'package:connectivity/connectivity.dart';
import 'no_connection_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final UsersList users = UsersList();
  late searchbar searchBar = new searchbar(getUsers);
  final scrollController = ScrollController();
  bool connectionStatus = true;
  bool searching = false;

  Future getUsers(String text) async {
    connectionStatus = await Connection.instance.CheckConnection();
    setState(() {
      searching = true;
    });
    if (text != "") {
      await users.fetchUsersFromApi(text);
      setState(() {
        searchBar.textController.clear();
        searching = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {


        await users.fetchMoreUsersFromApi();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
          Flexible(
              child: !connectionStatus
                  ? Center(
                      child: networkErrorView(
                          message:
                              'No Internet Connection.\nMind Trying again?'),
                    )
                  : searching
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8.0),
                          itemBuilder: (context, int index) => UserCard(
                            user: users.searchedList[index],
                            animationController: AnimationController(
                              duration:
                                  new Duration(milliseconds: animationTime),
                              vsync: this,
                            ),
                          ),
                          itemCount: users.searchedList.length,
                        )),
        ]),
      ),
    );
  }
}
