class CategoryModel {
  final int id;
  final String title, image;
  final bool isMain;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.isMain,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      isMain: json['main'],
    );
  }
}
