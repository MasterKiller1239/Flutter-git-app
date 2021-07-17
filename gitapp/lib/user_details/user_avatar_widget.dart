import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_details_model.dart';

Row userAvatarWidget(UserDetails userMock) {
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
                image: NetworkImage(userMock.avatarUrl),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            userMock.username,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ],
  );
}