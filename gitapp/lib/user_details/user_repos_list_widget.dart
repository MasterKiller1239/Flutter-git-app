import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import 'package:gitapp/user_details/user_repo_widget.dart';

class UserReposWidget extends StatelessWidget {

  final List<UserRepo> listRepos;

  UserReposWidget({required this.listRepos});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'REPOSITORIES',
              style: TextStyle(
                fontSize: 20.0,
                color: yyellow,
                letterSpacing: 1.5,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1.0, color: yyellow),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 300.0,
            width: 300.0,
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) => UserRepoWidget(userRepo: listRepos[index]),
              itemCount: listRepos.length,
            ),
          ),
        ]
    );
  }
}