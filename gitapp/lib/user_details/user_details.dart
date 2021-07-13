import 'package:gitapp/user_details/details.dart';

class DetailsMock {

  //DetailsMock({required this.username});
  //final String username;

  final String avatarUrl = 'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg';
  final String followers = '33';
  final String repositoriesCount = '3';
  final String country = 'Poland';
  final List<String> reposList = [
    'https://github.com/user/flutterApp',
    'https://github.com/user/swiftApp',
    'https://github.com/user/cObjApp'
  ];

  Details getDetails(String username) {
    return Details(avatarUrl: avatarUrl, username: username, followers: followers, repositoriesCount: repositoriesCount, country: country, repositories: reposList);
  }

}