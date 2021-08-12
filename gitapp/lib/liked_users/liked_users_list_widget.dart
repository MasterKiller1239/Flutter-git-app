import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/liked_users/liked_user_widget.dart';

import 'liked_users_model.dart';

class LikedUsersListWidget extends StatefulWidget {
  LikedUsersListWidget({required this.listLikedUsers});
  final List<LikedUser> listLikedUsers;

  @override
  _LikedUsersListWidgetState createState() => _LikedUsersListWidgetState();
}

class _LikedUsersListWidgetState extends State<LikedUsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'LIKED USERS',
              style: TextStyle(
                fontSize: 20.0,
                color: yyellow,
                letterSpacing: 1.5,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1.0, color: yyellow),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 400.0,
            width: 300.0,
            child: ListView.builder(
              //controller: scrollController,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) =>
                  LikedUserWidget(likedUser: widget.listLikedUsers[index]),
              itemCount: widget.listLikedUsers.length,
            ),
          ),
        ]);
  }
}
