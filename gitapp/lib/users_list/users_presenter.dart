import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

class UsersPresenter {
  List<User> userList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);

  UsersPresenter();

  Future<void> updateSearchedListFromApi(String username) async {
    searchedList = await ApiRepository.apirep.fetchUsers(username);
  }
}
