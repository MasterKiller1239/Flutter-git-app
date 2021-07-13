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
  //FGA-3
  List<UserCard> _card = <UserCard>[];
  final UsersList users = new UsersList();
  String name = "";
  final TextEditingController _textController = new TextEditingController();
  bool searching = false;

  Future _getUsers(String text) async {
    _card.clear();
    setState(() {
      searching = true;
    });
    if (text != "") {
      name = text;
      _textController.clear();
      users.fillSearchedUsers(text);

      print(users.searchedlist.length);
      if (users.searchedlist.length != 0) {
        users.searchedlist.forEach((element) {
          setState(() {
            _card.insert(
                0,
                UserCard(
                    user: element.username,
                    image: element.avatarUrl,
                    animationController: new AnimationController(
                      duration: new Duration(milliseconds: animationtime),
                      vsync: this,
                    )));
          });
          _card[0].animationController.forward();
        });

      }
    }
  }

  void dispose() {
    for (UserCard message in _card) message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            //FGA-4
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _getUsers,
                cursorColor: Colors.blueGrey,
                decoration: new InputDecoration.collapsed(
                    hintText: "Enter Github Username"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.search),
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
      body: new Container(
        child: new Column(children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
          new Divider(height: 2.0),
          new Flexible(
              child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            itemBuilder: (_, int index) => _card[index],
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
