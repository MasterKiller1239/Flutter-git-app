import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_details.dart';
import 'package:gitapp/users_list/User_card.dart';

import 'package:gitapp/users_list/users_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<UserCard> _card = <UserCard>[];
  final UsersList users = UsersList();
  String name = "";
  final TextEditingController _textController = TextEditingController();
  bool searching = false;

  Future _getUsers(String text) async {
    _card.clear();

    if (text != "") {
      name = text;
      _textController.clear();

      //users.fillSearchedUsers(text);
      await users.fetchUsers(text);

      if (users.searchedList.length != 0) {
        users.searchedList.forEach((element) {
          setState(() {
            _card.insert(
                0,
                UserCard(
                    user: element.username,
                    image: element.avatarURL,
                    animationController: AnimationController(
                      duration: Duration(milliseconds: animationTime),
                      vsync: this,
                    )));
          });
          _card[0].animationController.forward();
        });
      }
    }
  }

  void dispose() {
    for (UserCard message in _card)
      message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _getUsers,
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
            decoration: BoxDecoration(color: Theme
                .of(context)
                .cardColor),
            child: _buildTextComposer(),
          ),
          Divider(height: 2.0),
          Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemBuilder: (context, int index) => _card[index],
                itemCount: _card.length,
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
