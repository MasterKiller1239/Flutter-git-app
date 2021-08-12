import 'liked_users_model.dart';

class LikedUsersPresenter {
  LikedUsersPresenter();
  static final LikedUsersPresenter likedUsersPresenter =
      new LikedUsersPresenter();

  final List<LikedUser> listLikedUsers = <LikedUser>[];

  Future<void> addLikedUser(int id, String name, String url) async {
    LikedUser likedUser = LikedUser(id: id, name: name, url: url);
    listLikedUsers.add(likedUser);
  }

  Future<List<LikedUser>> getLikedUsersList() async {
    return listLikedUsers;
  }
}
