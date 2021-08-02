import 'package:flutter/material.dart';
import 'package:gitapp/HomePage/searchbar.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/users_list/user_card.dart';
import 'package:gitapp/users_list/users_list.dart';
import 'package:connectivity/connectivity.dart';
import 'no_connection.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final UsersList users = UsersList();

  bool connectionStatus = true;
  bool searching = false;

  Future getUsers(String text) async {
    CheckConnection();

    if (text != "") {
      searching = true;
      await users.fetchUsers(text);
      setState(() {
        searchBar.textController.clear();
        searching = false;
      });
    }
  }
  late searchbar searchBar = new searchbar(getUsers);
  Future CheckConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        connectionStatus = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        connectionStatus = true;
      } else
        connectionStatus = false;
    });
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
