import 'package:dartz/dartz.dart';
import 'package:recipe_finder/core/error/failure.dart';
import 'package:recipe_finder/features/Find-Recipe/data/Models/recipe_image_model/recipe_image_model.dart';

import '../../data/Models/gemini_model/gemini_recipe_details.dart';

abstract class RecipeFinderRepo {
  Future<Either<Failure, RecipeDetails>> findRecipes(String foodName);
  Future<Either<Failure, String>> createFood(String ingredients);
  Future<Either<Failure, RecipeImageModel>> getImages(String foodName);
}
