import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_avatar_widget.dart';
import 'package:gitapp/user_details/user_details_repository.dart';
import 'package:gitapp/user_details/user_info_widget.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repos_list_widget.dart';
import 'package:gitapp/user_details/user_details_presenter.dart';

Future<List<UserRepo>> repositoriesList(int userId) async =>
    await UserDetailsPresenter.userDetailsPresenter.getRepositoriesList(userId);
Future<UserDetails> userDetails(int userId) async =>
    await UserDetailsRepository.userDetailsRepository.fetchUserDetails(userId);

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.userId});
  final int userId;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    userDetails(widget.userId);
    repositoriesList(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait(
              [userDetails(widget.userId), repositoriesList(widget.userId)]),
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
                                onPressed: () => setState(() {})
                            ))]));
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
