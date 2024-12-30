import 'dart:convert';

class RecipeDetails {
  String? recipeDescription;
  List<dynamic>? recipeIngredients;
  List<dynamic>? recipeInstructions;
  String? recipeName;

  RecipeDetails({
    this.recipeDescription,
    this.recipeIngredients,
    this.recipeInstructions,
    this.recipeName,
  });

  factory RecipeDetails.fromMap(Map<String, dynamic> data) => RecipeDetails(
        recipeDescription: data['recipeDescription'] as String?,
        recipeIngredients: data['recipeIngredients'] as List<dynamic>?,
        recipeInstructions: data['recipeInstructions'] as List<dynamic>?,
        recipeName: data['recipeName'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'recipeDescription': recipeDescription,
        'recipeIngredients': recipeIngredients,
        'recipeInstructions': recipeInstructions,
        'recipeName': recipeName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RecipeDetails].
  factory RecipeDetails.fromJson(String data) {
    return RecipeDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RecipeDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
