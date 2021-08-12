import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/liked_users/liked_users_view.dart';

class LikeUsersHomeWidget extends StatelessWidget {
  const LikeUsersHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LikedUsersWidget()));
        },
        child: const Text(
          'Liked users',
          style: TextStyle(
              letterSpacing: 0.5, color: yyellow),),
      ),
    );
  }
}