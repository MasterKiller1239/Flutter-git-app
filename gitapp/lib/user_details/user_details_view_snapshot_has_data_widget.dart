import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_avatar_widget.dart';
import 'package:gitapp/user_details/user_details_view.dart';
import 'package:gitapp/user_details/user_info_widget.dart';
import 'package:gitapp/user_details/user_repos_list_widget.dart';

class UserDetailsViewSnapshotHasData extends StatelessWidget {
  const UserDetailsViewSnapshotHasData(
      {Key? key, required this.widget, required this.snapshot})
      : super(key: key);

  final AsyncSnapshot<dynamic> snapshot;
  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20.0),
      UserAvatarWidget(
          username: snapshot.data[1].username,
          avatarUrl: snapshot.data[1].avatarUrl),
      UserInfoWidget(
          followersCount: snapshot.data[1].followersCount,
          repositoriesCount: snapshot.data[1].repositoriesCount),
      Divider(height: 35.0, color: yyellow, indent: 30.0, endIndent: 30.0),
      UserReposWidget(userId: widget.userId, listRepos: snapshot.data[2])
    ]);
  }
}
