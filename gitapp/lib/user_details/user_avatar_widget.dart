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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: 'location-img-$username',
                child: Image.network(
                  avatarUrl,
                  height: 150.0,
                  width: 150.0,
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