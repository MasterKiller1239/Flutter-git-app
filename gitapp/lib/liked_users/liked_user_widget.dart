import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'liked_users_model.dart';

class LikedUserWidget extends StatelessWidget {
  final LikedUser likedUser;
  LikedUserWidget({required this.likedUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 80.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: wwhite,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3.0, color: borderColor),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(likedUser.url),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      likedUser.name,
                      style: TextStyle(
                          fontSize: 14.0, letterSpacing: 2.0, color: bblack),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0)
      ],
    );
  }
}
