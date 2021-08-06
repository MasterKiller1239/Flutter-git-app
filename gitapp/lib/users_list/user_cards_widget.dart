import 'package:flutter/material.dart';
import 'package:gitapp/users_list/user_card_widget.dart';
import 'package:gitapp/users_list/users_presenter.dart';

class UserCards extends StatelessWidget {
  final UsersPresenter users;

  UserCards({required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, int index) => UserCard(
        user: users.searchedList[index],
      ),
      itemCount: users.searchedList.length,
    );
  }
}
