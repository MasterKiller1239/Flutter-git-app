import 'package:gitapp/constants/states.dart';
import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

import 'connection_presenter.dart';

class UsersPresenter {
  List<User> userList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);
  int currentPage = 1;
  String currentUsername = "";
  static final UsersPresenter presenter = new UsersPresenter();

  UsersPresenter();

  Future<AppState> updateSearchedListFromApi(String username) async {
    if (await Connection.instance.checkConnection() == false) {
      return AppState.noConnection;
    } else {
      searchedList = await ApiRepository.apirep.fetchUsers(username);
      currentPage = 1;
      currentUsername = username;
      return AppState.updated;
    }
  }

  Future<void> fetchMoreUsersFromApi() async {
    currentPage++;
    searchedList.addAll(await ApiRepository.apirep
        .fetchUsers(currentUsername, page: currentPage));
  }

  void clearSearchList() {
    searchedList.clear();
  }
}
