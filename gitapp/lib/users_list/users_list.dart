import 'package:flutter/material.dart';
import 'package:gitapp/users_list/user.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class UsersList {
  List<User> userList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);

  UsersList() {
    List<String> usersNames = ['Tytus', 'Romek', 'Atomek', 'Bolek', 'Lolek'];
    userList = usersNames
        .map((name) => User(
              username: name,
              avatarURL:
                  'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg',
              id: 1,
            ))
        .toList();
  }

  Future<bool> fetchUsers(String username) async {
    String httpadress =
        'https://api.github.com/search/users?q=$username&per_page=20';
    searchedList.clear();
    http.Response response = await http.get(Uri.parse(httpadress));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      data['items'].forEach((user) {
        searchedList.add(User.fromJSON(user));
      });
      return true;
    }
    return false;
  }

  void fillSearchedUsersList(String text) {
    searchedList.clear();

    searchedList = userList
        .where((element) =>
            element.username.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
