import 'dart:convert';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import "package:http/http.dart" as http;

late int page;


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

  page = 1;

  String url = "https://api.github.com/user/$userId/repos?per_page=3&page=$page";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return ReposList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get repos from API.');
  }

}

class MoreReposList {

  List<UserRepo> listRepos;

  MoreReposList({required this.listRepos});

  factory MoreReposList.fromJson(List<dynamic> json, List<UserRepo> currentList){
    List<UserRepo> listRepos = currentList;
    listRepos = json.map((r) => UserRepo.fromJSON(r)).toList();
    return MoreReposList(listRepos: listRepos);
  }

}

Future<MoreReposList> getMoreReposListFromAPI(int userId, List<UserRepo> currentList) async {

  page++;

  String url = "https://api.github.com/user/$userId/repos?per_page=2&page=$page";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return MoreReposList.fromJson(json.decode(response.body), currentList);
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