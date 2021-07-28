class User {
  String username;
  String avatarURL;
  int id;

  User({required this.avatarURL, required this.username, required this.id});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      username: data['login'] ?? '',
      avatarURL: data['avatar_url'] ?? '',
      id: data['id'] ?? 0,
    );
  }

  static User fromJson(Map<String, Object?> json) => User(
      id: json[UserFields.id] as int,
      username: json[UserFields.login] as String,
      avatarURL: json[UserFields.avatar_url] as String);

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.login: username,
        UserFields.avatar_url: avatarURL,
      };
}

class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, login, avatar_url
  ];

  static final String id = 'id';
  static final String login = 'login';
  static final String avatar_url = 'avatar_url';
}
