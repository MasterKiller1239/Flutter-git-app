import 'package:flutter/material.dart';
import 'package:gitapp/users_list/user_card_widget.dart';
import 'package:gitapp/users_list/users_presenter.dart';

class UserCards extends StatefulWidget {
  final UsersPresenter users;

  UserCards({required this.users});

  @override
  _UserCardsState createState() => _UserCardsState();
}

class _UserCardsState extends State<UserCards> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await widget.users.fetchMoreUsersFromApi();
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
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, int index) => UserCard(
        user: widget.users.searchedList[index],
      ),
      itemCount: widget.users.searchedList.length,
    );
  }
}
