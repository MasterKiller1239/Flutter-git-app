import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/repo_details/user_repo.dart';
import 'package:gitapp/repo_details/user_repo_list_presenter.dart';

class UserRepoPage extends StatelessWidget {

late UserRepoListPresenter presenter;

UserRepoPage() {
  presenter = UserRepoListPresenter(this);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Important add the app bar to the Scaffold
      appBar: new AppBar(
        title: new Text("The title for app bar"),
      ),
      //Add the body of the layout
      body: Column(
        children: [
          Text("Here are my repo items"),
          UserRepoList(presenter.getRepos()),
        ],
      ),
    );
  }
}

class UserRepoList extends StatelessWidget {

  final List<UserRepo> elements;

  UserRepoList(this.elements);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: elements.length,
      itemBuilder: (context, index) {
        final item = elements[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(item.name.substring(0, 1)),
          ),
          title: Text(item.name),
          subtitle: Text(item.url),
        );
      },
    );
  }
}
