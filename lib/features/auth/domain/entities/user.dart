class UserEntity {
  final String username;
  final String? name;
  final String id;

  UserEntity({
    required this.id,
    required this.username,
    this.name
  });
}
