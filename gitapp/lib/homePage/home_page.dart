import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/database_helper/database_helper.dart';
import 'package:gitapp/homePage/api_search_view.dart';
import 'package:gitapp/homePage/database_search_view.dart';
import 'package:gitapp/users_list/user_card_api.dart';
import 'package:gitapp/users_list/users_list.dart';
import 'package:connectivity/connectivity.dart';
import 'empty_list.dart';
import 'no_connection.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void dispose() {
    DatabaseHandler.instance.close();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text(widget.title),
              bottom: new TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text("API")),
                  Tab(child: Text("DATABASE")),
                ],
              )),
          body: new TabBarView(
            children: [
              apiSearchView(),
              dbSearchView(),
            ],
          ),
        ));
  }
}
