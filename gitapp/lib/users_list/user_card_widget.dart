import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/details_page.dart';
import 'package:gitapp/users_list/user_model.dart';

class UserCard extends StatelessWidget {
  UserCard({
    required this.user,
    required this.animationController,
  }) {
    this.animationController.forward();
  }

  final User user;
  final AnimationController animationController;

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
                    builder: (context) => DetailScreen(user: user.username)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            margin: EdgeInsets.only(right: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: 'location-img-${user.username}',
                    child: Image.network(
                      user.avatarURL,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(user.username,
                          style: Theme.of(context).textTheme.headline2),
                      Padding(padding: EdgeInsets.only(bottom: 24.0)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
