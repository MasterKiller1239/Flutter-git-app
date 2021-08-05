import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

class UsersPresenter {
  List<User> userList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);
  int currentPage = 1;
  String currentUsername = "";

  UsersPresenter();

  Future<void> fetchUsersFromApi(String username) async {
    searchedList = await ApiRepository.apirep.fetchUsers(username);
    searchedList = await apiRepository.apirep.fetchUsers(username);
    currentPage = 1;
    currentUsername = username;
  }

  Future<void> fetchMoreUsersFromApi() async {
    currentPage++;
    searchedList.addAll(await apiRepository.apirep
        .fetchUsers(currentUsername, page: currentPage));
  }
}