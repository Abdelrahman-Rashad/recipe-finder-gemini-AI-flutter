// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:recipe_finder/core/error/failure.dart';
import 'package:recipe_finder/features/Find-Recipe/data/Models/recipe_image_model/recipe_image_model.dart';
import 'package:recipe_finder/features/Find-Recipe/data/data_source/recipe_finder_dataSource.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/repository/recipe_finder_repo.dart';

import '../Models/gemini_model/gemini_recipe_details.dart';

class RecipeFinderRepoImpl extends RecipeFinderRepo {
  RecipeFinderDataSource recipeFinderDataSource;
  RecipeFinderRepoImpl({
    required this.recipeFinderDataSource,
  });
  @override
  Future<Either<Failure, String>> createFood(String ingredients) {
    // TODO: implement createFood
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecipeDetails>> findRecipes(String foodName) async {
    try {
      final responseContent =
          await recipeFinderDataSource.findRecipes(foodName);
      log(responseContent.recipeIngredients.toString());
      log(responseContent.recipeInstructions.toString());
      return Right(responseContent);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, RecipeImageModel>> getImages(String foodName) async {
    try {
      RecipeImageModel recipeImageModel =
          await recipeFinderDataSource.getImages(foodName);
      return Right(recipeImageModel);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
