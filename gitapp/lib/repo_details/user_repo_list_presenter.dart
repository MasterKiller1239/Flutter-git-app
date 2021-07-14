import 'package:gitapp/repo_details/user_repo.dart';
import 'package:gitapp/repo_details/user_repo_page.dart';

class UserRepoListPresenter {

final UserRepoPage view;

  UserRepoListPresenter(this.view);

  List<UserRepo> getRepos() {
    //Network call
    var array = [
      UserRepo("Repo1", "repo2"),
      UserRepo("Srepo2", "repo4"),
      UserRepo("Wrepo3", "repo6"),
      UserRepo("Mepo4", "repo8"),
      UserRepo("Mepo4", "repo8"),
      UserRepo("Mepo4", "repo8"),
    ];
    return array;
  }
}
