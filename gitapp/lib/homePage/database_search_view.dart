import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/database_helper/database_helper.dart';
import 'package:gitapp/homePage/empty_list.dart';
import 'package:gitapp/users_list/user_card_db.dart';
import 'package:gitapp/users_list/users_list.dart';

class dbSearchView extends StatefulWidget {
  dbSearchView();
  final GlobalKey<dbSearchViewState> cartKey = GlobalKey();
  @override
  dbSearchViewState createState() => dbSearchViewState();
}

class dbSearchViewState extends State<dbSearchView>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  bool searching = false;

  Future getUsersFromDBbyName(String text) async {
    setState(() => searching = true);
    if (text != "") {
      await UsersList.instance.getDBUsersByName(text);
      setState(() {
        _textController.clear();
      });
    }
    setState(() => searching = false);
  }

  Future getAllUsersFromDB() async {
    DatabaseHandler.instance.getAllUsers();
    setState(() => searching = true);

      await UsersList.instance.getAllDBUsers();
      setState(() {
        _textController.clear();
      });

    setState(() => searching = false);
  }
  @override
  void initState() {
    super.initState();
    getAllUsersFromDB();
  }

  Future close() async {
    final db = await DatabaseHandler.instance.database;

    db.close();
  }
  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: getUsersFromDBbyName,
                cursorColor: cursorColor,
                decoration:
                    InputDecoration.collapsed(hintText: "Enter Username"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () =>
                        getUsersFromDBbyName(_textController.text))),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
        Divider(height: 2.0),
        Flexible(
            child: searching
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                :UsersList.instance.databaseList.isEmpty?emptyListView() : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (context, int index) => UserCardDB(
                      user: UsersList.instance.databaseList[index],
                      animationController: AnimationController(
                        duration: new Duration(milliseconds: animationTime),
                        vsync: this,
                      ), refreshDatabaseList: getAllUsersFromDB,
                    ),
                    itemCount: UsersList.instance.databaseList.length,
                  )),
      ]),
    );
  }
}
