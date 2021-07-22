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

  DetailScreen({required this.user_id});
  final int user_id;

  late UserDetails userDetails;
  late List<UserRepo> reposList;

  Future getUsers() async {
    userDetails = await getInfoFromAPI(user_id);
  }

  Future getReposList() async {
    reposList = await getReposListFromAPI(user_id);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          UserAvatarWidget(username: userDetails.username, avatarUrl: userDetails.avatarUrl),
          UserInfoWidget(followersCount: userDetails.followersCount, repositoriesCount: userDetails.repositoriesCount),
          Divider(height: 35.0, color: yyellow, indent: 30.0, endIndent: 30.0),
          UserReposWidget(listRepos: reposList),
        ]
      ),
    );
  }
}