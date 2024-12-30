// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:recipe_finder/core/error/failure.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/repository/recipe_finder_repo.dart';

import '../../data/Models/gemini_model/gemini_recipe_details.dart';

class FindRecipeUseCase {
  FindRecipeUseCase(
    this.recipeFinder,
  );
  final RecipeFinderRepo recipeFinder;

  Future<Either<Failure, RecipeDetails>> execute(String query) async {
    return await recipeFinder.findRecipes(query);
  }
}
