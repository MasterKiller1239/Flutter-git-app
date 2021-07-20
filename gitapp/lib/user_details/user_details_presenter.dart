import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_repo_model.dart';

UserDetails getMockedInfo(String user){
  return UserDetails(id: 1, avatarUrl: 'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg', username: user, followersCount: 43, repositoriesCount: 3, country: 'Poland');
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