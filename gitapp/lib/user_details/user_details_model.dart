class UserDetails {
  final int id;
  final String username;
  final String avatarUrl;
  final int followersCount;
  final int repositoriesCount;
  UserDetails({required this.id, required this.avatarUrl, required this.username, required this.followersCount, required this.repositoriesCount});

  factory UserDetails.fromJSON(Map<String, dynamic> data) {
    return UserDetails(
      id: data['id'] ?? 0,
      username: data['login'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
      followersCount: data['followers'] ?? 0,
      repositoriesCount: data['public_repos'] ?? 0
    );
  }
}