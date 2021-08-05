import 'package:gitapp/users_list/user_model.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class ApiRepository {
  ApiRepository();

  static final ApiRepository apirep = new ApiRepository();

  Future<List<User>> fetchUsers(String username) async {
    List<User> listofUsers = List.empty(growable: true);
    String httpaddress =
        'https://api.github.com/search/users?q=$username&per_page=100';
    http.Response response = await http.get(Uri.parse(httpaddress));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      data['items'].forEach((user) {
        listofUsers.add(User.fromJSON(user));
      });
    }
    return listofUsers;
  }
}
