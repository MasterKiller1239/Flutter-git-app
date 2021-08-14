import 'package:gitapp/constants/states.dart';
import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

import 'db_repository.dart';

import 'connection_presenter.dart';

class UsersPresenter {
  List<User> dbList = List.empty(growable: true);
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
      await sendUsersToDB();
      return AppState.updated;
    }
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

  void clearSearchList() {
    searchedList.clear();
  }
}
