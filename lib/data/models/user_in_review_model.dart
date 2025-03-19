class UserInReviewModel {
  final int id;
  final String image;
  final String username;

  UserInReviewModel({
    required this.id,
    required this.image,
    required this.username,
  });

  factory UserInReviewModel.fromJson(Map<String, dynamic> json) {
    return UserInReviewModel(
      id: json['id'],
      image: json['profilePhoto'],
      username: json['username'],
    );
  }
}
