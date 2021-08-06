import 'package:gitapp/users_list/user_model.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class ApiRepository {
  ApiRepository();

  static final ApiRepository apirep = new ApiRepository();

  Future<List<User>> fetchUsers(String username, {int page = 1}) async {
    List<User> listofUsers = List.empty(growable: true);
    String httpAddress =
        'https://api.github.com/search/users?q=$username&per_page=100';
    http.Response response = await http.get(Uri.parse(httpAddress));
    String httpaddress =
        'https://api.github.com/search/users?q=$username&page=$page';
    http.Response response = await http.get(Uri.parse(httpaddress));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      listofUsers =
          (data['items'] as List).map((user) => User.fromJSON(user)).toList();
      print(listofUsers.length);
    }
    return listofUsers;
  }
}
