import 'package:gitapp/user_details/user_details_repository.dart';
import 'package:gitapp/user_details/user_repo_model.dart';

class UserDetailsPresenter {
  List<UserRepo> listRepos = <UserRepo>[];
  late int currentPage;

  UserDetailsPresenter();
  static final UserDetailsPresenter userDetailsPresenter =
      new UserDetailsPresenter();

  Future<List<UserRepo>> getRepositoriesList(int userId) async {
    currentPage = 1;
    listRepos = await UserDetailsRepository.userDetailsRepository
        .fetchRepositoriesList(userId, currentPage);
    return listRepos;
  }

  Future<void> getMoreRepositoriesList(int userId) async {
    currentPage++;
    listRepos.addAll(await UserDetailsRepository.userDetailsRepository
        .fetchRepositoriesList(userId, currentPage));
  }
}
