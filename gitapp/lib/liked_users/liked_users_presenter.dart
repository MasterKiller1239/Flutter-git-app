import 'liked_users_model.dart';

class LikedUsersPresenter {
  LikedUsersPresenter();
  static final LikedUsersPresenter likedUsersPresenter =
      new LikedUsersPresenter();

  final List<LikedUser> listLikedUsers = <LikedUser>[];

  Future<void> addLikedUser(LikedUser likedUser) async {
    listLikedUsers.add(likedUser);
  }
}
