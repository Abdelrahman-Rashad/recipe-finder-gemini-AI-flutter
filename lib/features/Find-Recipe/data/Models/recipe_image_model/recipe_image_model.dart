import 'dart:convert';

import 'photo.dart';

class RecipeImageModel {
  int? page;
  int? perPage;
  List<Photo>? photos;
  int? totalResults;
  String? nextPage;

  RecipeImageModel({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  factory RecipeImageModel.fromMap(Map<String, dynamic> data) {
    return RecipeImageModel(
      page: data['page'] as int?,
      perPage: data['per_page'] as int?,
      photos: (data['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromMap(e as Map<String, dynamic>))
          .toList(),
      totalResults: data['total_results'] as int?,
      nextPage: data['next_page'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'page': page,
        'per_page': perPage,
        'photos': photos?.map((e) => e.toMap()).toList(),
        'total_results': totalResults,
        'next_page': nextPage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RecipeImageModel].
  factory RecipeImageModel.fromJson(String data) {
    return RecipeImageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RecipeImageModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
