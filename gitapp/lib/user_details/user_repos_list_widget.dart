import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

Column userReposListWidget(UserRepo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(10.0),
        height: 60.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: wwhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Text(
              UserRepo.name,
              style: TextStyle(
                fontSize: 14.0,
                letterSpacing: 2.0,
                color: bblack,
              ),
            ),
            Divider(height: 7.0, color: bblack),
            Text(
              UserRepo.url,
              style: TextStyle(
                fontSize: 9.0,
                letterSpacing: 2.0,
                color: bblack,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10.0)
    ],
  );
}