class User {
  String username;
  String avatarUrl;

  User({required this.avatarUrl, required this.username});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      username: data['login'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
    );
  }
}
