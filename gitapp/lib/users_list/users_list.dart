import 'package:gitapp/users_list/user.dart';

List<User> addUsers()  {
  List<User> users = [];
for(int i=0;i<5;i++)
  {
    User user = new User(
        avatarUrl: "https://i.ytimg.com/vi/gAbi2_n8_Mw/maxresdefault.jpg",
        username: "User"+i.toString());
    users.add(user);
  }
  return users;
}
