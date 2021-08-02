import 'package:gitapp/users_list/api_repository.dart';
import 'package:gitapp/users_list/user_model.dart';

class UsersList {
  List<User> userList = List.empty(growable: true);
  List<User> searchedList = List.empty(growable: true);

  UsersList();

  Future<void> fetchUsersFromApi(String username) async {
    searchedList = await apiRepository.apirep.fetchUsers(username);
  }
}
