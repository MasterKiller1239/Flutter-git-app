import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_repo_model.dart';

class UserRepoWidget extends StatelessWidget {

  late UserRepo userRepo;

  UserRepoWidget({required this.userRepo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 75.0,
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
                  Text(
                    userRepo.name,
                    style: TextStyle(fontSize: 14.0, letterSpacing: 2.0, color: bblack),
                  ),
                  Text(

                    '⭐' + userRepo.stars.toString(),
                    style: TextStyle(fontSize: 14.0, letterSpacing: 2.0, color: bblack),
                  ),
                ],
              ),
              Divider(height: 7.0, color: bblack),
              Text(
                userRepo.url,
                style: TextStyle(fontSize: 9.0, letterSpacing: 2.0, color: bblack),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0)
      ],
    );
  }
}