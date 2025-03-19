class UserModelInRecipe {
  final int id;
  final String firstName, lastName, username;
  final String image;

  UserModelInRecipe({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.image,
  });

  factory UserModelInRecipe.fromJson(Map<String, dynamic> json) {
    return UserModelInRecipe(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      image: json['profilePhoto'],
    );
  }
}
