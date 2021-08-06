import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_avatar_widget.dart';
import 'package:gitapp/user_details/user_info_widget.dart';
import 'package:gitapp/user_details/user_repos_list_widget.dart';
import 'package:gitapp/user_details/user_details_presenter.dart';

Future<ReposList> getReposList(int userId) async => await getReposListFromAPI(userId);
Future<Details> getDetails(int userId) async => await getInfoFromAPI(userId);

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
    getDetails(widget.userId);
    getReposList(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([getDetails(widget.userId), getReposList(widget.userId)]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData) {
              return Column(
                  children: [
                    SizedBox(height: 20.0),
                    UserAvatarWidget(username: snapshot.data[0].userDetails.username, avatarUrl: snapshot.data[0].userDetails.avatarUrl),
                    UserInfoWidget(followersCount: snapshot.data[0].userDetails.followersCount, repositoriesCount: snapshot.data[0].userDetails.repositoriesCount),
                    Divider(height: 35.0, color: yyellow, indent: 30.0, endIndent: 30.0),
                    UserReposWidget(listRepos: snapshot.data[1].listRepos),
                  ]
              );
            } else if(snapshot.hasError) {
              throw Exception('Failed to fetch data from API.');
            }
            else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: CircularProgressIndicator()
                  )
              );
              // return Center(
              //   child: CircularProgressIndicator(),
              // );
            }
          },
        ),
      ),
    );
  }
}