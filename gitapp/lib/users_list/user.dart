class User {
  String username;
  String avatarURL;

  User({required this.avatarURL, required this.username});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      username: data['login'] ?? '',
      avatarURL: data['avatar_url'] ?? '',
    );
  }
}
