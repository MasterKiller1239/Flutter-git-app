import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

UserDetails getMockedInfo(String user){
  return UserDetails(id: 1, avatarUrl: 'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg', username: user, followersCount: 43, repositoriesCount: 3, /*country: 'Poland'*/);
}

List<UserRepo> getMockedRepos(String user) {
  List<UserRepo> listRepos = [
    UserRepo(id: 1, name: 'flutterapp', url: 'https://github.com/${user}/flutterapp'),
    UserRepo(
        id: 2, name: 'swiftapp', url: 'https://github.com/${user}/swiftapp'),
    UserRepo(
        id: 3, name: 'kotlinapp', url: 'https://github.com/${user}/kotlinapp')
  ];

  return listRepos;
}

Future<UserDetails> getInfoFromAPI(int id_user) async {

  String httpadress =
      "https://api.github.com/user/${id_user}";
  http.Response response = await http.get(Uri.parse(httpadress));
  if (response.statusCode == 200) {
    var data = convert.jsonDecode(response.body);
    return UserDetails.fromJSON(data);
  } else {
    return UserDetails(id: 0, avatarUrl: '', username: '', followersCount: 0, repositoriesCount: 0);
  }

}

Future<List<UserRepo>> getReposListFromAPI(int id_user) async {

  List<UserRepo> listRepos = [];

  String httpadress =
      "https://api.github.com/user/${id_user}/repos";
  http.Response response = await http.get(Uri.parse(httpadress));
  if (response.statusCode == 200) {

    var data = convert.jsonDecode(response.body);
    data['items'].forEach((repo) {
      listRepos.add(UserRepo.fromJSON(repo));
    });
    return listRepos;
  } else {
    return listRepos;
  }

}