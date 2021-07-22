class UserRepo {

  final int id;
  final String name;
  final String url;

  UserRepo({required this.id, required this.name, required this.url});

  factory UserRepo.fromJSON(Map<String, dynamic> data) {
    return UserRepo(
        id: data['id'] ?? 0,
        name: data['name'] ?? '',
        url: data['html_url'] ?? ''
    );
  }

}