import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_avatar_widget.dart';
import 'package:gitapp/user_details/user_info_widget.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import 'package:gitapp/user_details/user_repos_list_widget.dart';
import 'package:gitapp/user_details/user_details_presenter.dart';

class DetailScreen extends StatelessWidget {

  DetailScreen({required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {

    UserDetails mock = getMockedInfo(user);
    List<UserRepo> repo = getMockedRepos(user);

    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          UserAvatarWidget(username: mock.username, avatarUrl: mock.avatarUrl),
          UserInfoWidget(followersCount: mock.followersCount, repositoriesCount: mock.repositoriesCount, country: mock.country),
          Divider(height: 35.0, color: yyellow, indent: 30.0, endIndent: 30.0),
          UserReposWidget(listRepos: repo),
        ]
      ),
    );
  }
}