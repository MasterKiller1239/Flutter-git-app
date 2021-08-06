import 'dart:convert';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import "package:http/http.dart" as http;

UserDetails getMockedInfo(String user){
  return UserDetails(id: 1, avatarUrl: 'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg', username: user, followersCount: 43, repositoriesCount: 3, /*country: 'Poland'*/);
}

List<UserRepo> getMockedRepos(String user) {
  List<UserRepo> listRepos = [
    UserRepo(id: 1, name: 'flutterapp', url: 'https://github.com/${user}/flutterapp', stars: 1),
    UserRepo(
        id: 2, name: 'swiftapp', url: 'https://github.com/${user}/swiftapp', stars: 1),
    UserRepo(
        id: 3, name: 'kotlinapp', url: 'https://github.com/${user}/kotlinapp', stars: 1)
  ];

  return listRepos;
}

class ReposList {

  List<UserRepo> listRepos;

  ReposList({required this.listRepos});

  factory ReposList.fromJson(List<dynamic> json){
    List<UserRepo> listRepos = <UserRepo>[];
    listRepos = json.map((r) => UserRepo.fromJSON(r)).toList();
    return ReposList(listRepos: listRepos);
  }

}

Future<ReposList> getReposListFromAPI(int userId) async {

  String url = "https://api.github.com/user/$userId/repos";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return ReposList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get repos from API.');
  }

}

class Details {

  late UserDetails userDetails;

  Details({required this.userDetails});

  factory Details.fromJson(Map<String, dynamic> json){
    UserDetails userDetails = UserDetails(id: 0, avatarUrl: '', username: '', followersCount: 0, repositoriesCount: 0);
    userDetails = UserDetails.fromJSON(json);
    return Details(userDetails: userDetails);
  }

}

Future<Details> getInfoFromAPI(int userId) async {

  String url = "https://api.github.com/user/$userId";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Details.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get repos from API.');
  }

}