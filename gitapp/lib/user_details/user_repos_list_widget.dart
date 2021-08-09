import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/user_details_api_repository.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import 'package:gitapp/user_details/user_repo_widget.dart';

class UserReposWidget extends StatefulWidget {
  final List<UserRepo> listRepos;
  final int userId;

  UserReposWidget({required this.listRepos, required this.userId});

  @override
  _UserReposWidgetState createState() => _UserReposWidgetState();
}

class _UserReposWidgetState extends State<UserReposWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await getMoreReposListFromAPI(widget.userId, widget.listRepos);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
              controller: scrollController,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) => UserRepoWidget(userRepo: widget.listRepos[index]),
              itemCount: widget.listRepos.length,
            ),
          ),
        ]
    );
  }
}