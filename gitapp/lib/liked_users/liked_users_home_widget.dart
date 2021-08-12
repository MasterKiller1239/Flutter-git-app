import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/liked_users/liked_users_view.dart';
import 'liked_users_model.dart';
import 'liked_users_presenter.dart';

class LikeUsersHomeWidget extends StatelessWidget {
  const LikeUsersHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LikedUsersWidget()));
          },
          child: Text(
            '⭐',
          ),
        ),
      ),
    );
  }
}
