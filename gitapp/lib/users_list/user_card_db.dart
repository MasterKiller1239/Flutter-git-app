import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/database_helper/database_helper.dart';
import 'package:gitapp/user_details/details_page.dart';
import 'package:gitapp/users_list/user.dart';

class UserCardDB extends StatefulWidget {
  UserCardDB({
    required this.user,
    required this.animationController,
    required this.refreshDatabaseList,
  }) {
    this.animationController.forward();
  }

  final Function() refreshDatabaseList;
  final User user;
  final AnimationController animationController;

  @override
  _UserCardDBState createState() => _UserCardDBState();
}

class _UserCardDBState extends State<UserCardDB> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.5, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.linear,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: RaisedButton(
              color: secondaryLight,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(user: widget.user.username)));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                margin: EdgeInsets.only(right: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16.0),
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: borderColor),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.user.avatarURL),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.user.username,
                              style: Theme.of(context).textTheme.title),
                          Padding(padding: EdgeInsets.only(bottom: 24.0)),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                        child: Icon(Icons.clear),
                        onPressed: () async {
                          await DatabaseHandler.instance
                              .deleteUser(widget.user.id);
                          widget.refreshDatabaseList();
                        })
                  ],
                ),
              )),
        ));
  }
}
