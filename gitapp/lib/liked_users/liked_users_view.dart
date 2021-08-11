import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'liked_users_model.dart';
import 'liked_users_presenter.dart';

Future<List<LikedUser>?> likedUsersList() async =>
    await LikedUsersPresenter.likedUsersPresenter.getLikedUsersList();

class LikedUsersWidget extends StatefulWidget {
  @override
  _LikedUsersWidgetState createState() => _LikedUsersWidgetState();
}

class _LikedUsersWidgetState extends State<LikedUsersWidget> {
  @override
  void initState() {
    super.initState();
    likedUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liked users"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: likedUsersList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                SizedBox(height: 20.0),
                UserAvatarWidget(
                    username: snapshot.data[0].username,
                    avatarUrl: snapshot.data[0].avatarUrl),
                UserInfoWidget(
                    followersCount: snapshot.data[0].followersCount,
                    repositoriesCount: snapshot.data[0].repositoriesCount),
                Divider(
                    height: 35.0,
                    color: yyellow,
                    indent: 30.0,
                    endIndent: 30.0),
                UserReposWidget(
                    userId: widget.userId, listRepos: snapshot.data[1])
              ]);
            } else if (snapshot.hasError) {
              return Container(
                  height: 120.0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.0),
                        Center(child: Text('Failed to fetch data from API.')),
                        Center(
                            child: IconButton(
                                icon: Icon(Icons.wifi_protected_setup),
                                onPressed: () => setState(() {})))
                      ]));
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}