import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

import 'db_repository.dart';

class UsersPresenter {
  List<User> dbList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);
  int currentPage = 1;
  String currentUsername = "";

  UsersPresenter();

  Future<void> updateSearchedListFromApi(String username) async {
    searchedList = await ApiRepository.apirep.fetchUsers(username);
    await sendUsersToDB();
    currentPage = 1;
    currentUsername = username;
  }

  Future<void> fetchMoreUsersFromApi() async {
    currentPage++;
    searchedList.addAll(await ApiRepository.apirep
        .fetchUsers(currentUsername, page: currentPage));
    await sendUsersToDB();
  }

  Future<void> getAllUsersFromDB() async {
    dbList.clear();
    dbList = await DatabaseHandler.instance.getAllUsers();
  }
  Future<void> getUsersFromDBbyName(String string) async {
    dbList.clear();
    dbList = await DatabaseHandler.instance.getUsersFromDatabase(string);
  }
  Future<void> sendUsersToDB() async {
    if(searchedList.isNotEmpty)
        await DatabaseHandler.instance.addUsersToDatabase(searchedList);
  }
}
