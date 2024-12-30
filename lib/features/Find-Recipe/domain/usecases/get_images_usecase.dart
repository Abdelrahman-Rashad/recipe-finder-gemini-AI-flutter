import 'package:dartz/dartz.dart';
import 'package:recipe_finder/features/Find-Recipe/data/Models/recipe_image_model/recipe_image_model.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/repository/recipe_finder_repo.dart';

import '../../../../core/error/failure.dart';

class GetImagesUseCase {
  GetImagesUseCase(
    this.recipeFinder,
  );
  final RecipeFinderRepo recipeFinder;

  Future<Either<Failure, RecipeImageModel>> execute(String query) async {
    return await recipeFinder.getImages(query);
  }
}
