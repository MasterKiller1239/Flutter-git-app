import 'dart:convert';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import "package:http/http.dart" as http;

class UserDetailsRepository {
  UserDetailsRepository();
  static final UserDetailsRepository userDetailsRepository = new UserDetailsRepository();

  Future<UserDetails> fetchUserDetails(int userId) async {
    String url = "https://api.github.com/user/$userId";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return UserDetails.fromJSON(json.decode(response.body));
    } else {
      return UserDetails(id: 0, avatarUrl: '', username: '', followersCount: 0, repositoriesCount: 0);
    }
  }

  Future<List<UserRepo>> fetchRepositoriesList(int userId, currentPage) async {
    List<UserRepo> listRepos = <UserRepo>[];
    String url = "https://api.github.com/user/$userId/repos?per_page=3&$currentPage";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      listRepos = data.map((r) => UserRepo.fromJSON(r)).toList();
      return listRepos;
    } else {
      return listRepos;
    }
  }
}