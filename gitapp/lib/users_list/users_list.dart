import 'package:flutter/material.dart';
import 'package:gitapp/users_list/user.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class UsersList {
  List<User> userlist = List.empty(growable: true);
  List<User> searchedlist = List.empty(growable: true);

  UsersList() {
    List<String> usersnames = ['Tytus', 'Romek', 'Atomek', 'Bolek', 'Lolek'];
    userlist = usersnames
        .map((name) => User(
            username: name,
            avatarUrl:
                'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg'))
        .toList();
  }

  Future<bool> fetchUsers(String username) async {
    String httpadress =
        'https://api.github.com/search/users?q=$username&per_page=5';

    searchedlist.clear();
    http.Response response = await http.get(Uri.parse(httpadress));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);


      data['items'].forEach((user) {
        searchedlist.add(User.fromJSON(user));
      });
      return true;
    }
    return false;
  }

  void fillSearchedUsers(String text) {
    searchedlist.clear();

    searchedlist = userlist
        .where((element) =>
            element.username.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
