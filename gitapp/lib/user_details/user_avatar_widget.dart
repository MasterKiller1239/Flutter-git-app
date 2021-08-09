import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class UserAvatarWidget extends StatelessWidget {
  final String username;
  final String avatarUrl;
  UserAvatarWidget({required this.username, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        Column(
          children: <Widget> [
            Container(
              height: 130.0,
              width: 130.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: yyellow),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(avatarUrl),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              username,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}