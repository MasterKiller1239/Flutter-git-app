import 'package:gitapp/users_list/user.dart';
class UsersList {
  List<User> userlist= List.empty(growable: true);
  List<User> searchedlist= List.empty(growable: true);
  UsersList();

void createUsers()  {
  userlist.clear();
for(int i=0;i<5;i++)
  {

    User user = new User(
        avatarUrl: 'https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg',
        username: "User"+i.toString());
    userlist.add(user);
  }


}

  void GetSearchedUsers(String text)
  {

      searchedlist.clear();
    for (User user in userlist)
    {
      if(user.username.toLowerCase().contains(text.toLowerCase())) {
        searchedlist.add(user);
      }
    }


  }
}