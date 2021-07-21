import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_details.dart';
import 'package:gitapp/users_list/user_card.dart';
import 'package:gitapp/users_list/users_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final UsersList users = UsersList();
  final TextEditingController _textController = TextEditingController();
  bool searching = false;

  Future _getUsers(String text) async {
    if (text != "") {

      //users.fillSearchedUsers(text);
      await users.fetchUsers(text);
      setState(() {
        _textController.clear();
      });

    }
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
                cursorColor: cursorColor,
                decoration: InputDecoration.collapsed(
                    hintText: "Enter Github Username"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _getUsers(_textController.text))),
          ]),
        ));
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
            child: _buildTextComposer(),
          ),
          Divider(height: 2.0),
          Flexible(
              child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, int index) =>
                UserCard(user: users.searchedList[index], animationController: AnimationController(
                  duration: new Duration(milliseconds: animationTime),
                  vsync: this,
                ),),
            itemCount: users.searchedList.length,
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
