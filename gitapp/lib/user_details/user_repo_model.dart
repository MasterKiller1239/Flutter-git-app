class UserRepo {

  final int id;
  final String name;
  final String url;
  final int stars;

  UserRepo({required this.id, required this.name, required this.url, required this.stars});

  factory UserRepo.fromJSON(Map<String, dynamic> data) {
    return UserRepo(
        id: data['id'] ?? 0,
        name: data['name'] ?? '',
        url: data['html_url'] ?? '',
        stars: data['stargazers_count'] ?? ''
    );
  }

}