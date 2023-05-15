class MainCategory {
  String id;
  String name;
  String description;
  String bottomDescription;
  String pictureUrl;
  dynamic icon;
  String pictureId;

  MainCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.bottomDescription,
    required this.pictureUrl,
    this.icon,
    required this.pictureId,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
    id: json["Id"],
    name: json["Name"],
    description: json["Description"],
    bottomDescription: json["BottomDescription"],
    pictureUrl: json["PictureURL"],
    icon: json["Icon"],
    pictureId: json["PictureId"],
  );

  static List<MainCategory> catsFromSnapshot(List catSnapshot) {
    return catSnapshot.map((json) {
      return MainCategory.fromJson(json);
    }).toList();
  }
}