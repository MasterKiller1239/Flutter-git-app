import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/liked_users/liked_users_presenter.dart';
import 'package:gitapp/user_details/user_details_view.dart';
import 'package:gitapp/users_list/user_model.dart';

class UserCard extends StatelessWidget {
  UserCard({
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(userId: user.id)));
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
                      image: NetworkImage(user.avatarURL),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            LikedUsersPresenter.likedUsersPresenter
                                .addLikedUser(
                                    user.id, user.username, user.avatarURL);
                          },
                          icon: Text('⭐', style: TextStyle(fontSize: 25))),
                      Text(user.username,
                          style: Theme.of(context).textTheme.headline2),
                      Padding(padding: EdgeInsets.only(bottom: 24.0))
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
