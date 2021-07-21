class User {
  String username;
  String avatarURL;
  int id;
  User({required this.avatarURL, required this.username,required this.id});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      username: data['login'] ?? '',
      avatarURL: data['avatar_url'] ?? '',
      id: data['id'] ?? 0,
    );
  }
}
