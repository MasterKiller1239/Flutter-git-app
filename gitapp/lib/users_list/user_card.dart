import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/details_page.dart';
import 'package:gitapp/users_list/user.dart';

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
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.5, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.linear,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: RaisedButton(
              color: secondaryLight,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(userId: user.id)));
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
                          Text(user.username,
                              style: Theme.of(context).textTheme.title),
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