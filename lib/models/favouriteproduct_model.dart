const String tableOffavourites = 'favourites';

class FavouriteFields {
  static final List<String> values = [
    id, title, description, time
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class FavouriteProduct {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const FavouriteProduct({
    this.id,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  FavouriteProduct copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      FavouriteProduct(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static FavouriteProduct fromJson(Map<String, Object?> json) => FavouriteProduct(
    id: json[FavouriteFields.id] as int?,
    title: json[FavouriteFields.title] as String,
    description: json[FavouriteFields.description] as String,
    createdTime: DateTime.parse(json[FavouriteFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    FavouriteFields.id: id,
    FavouriteFields.title: title,
    FavouriteFields.description: description,
    FavouriteFields.time: createdTime.toIso8601String(),
  };
}