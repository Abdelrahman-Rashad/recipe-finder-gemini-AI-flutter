import 'package:dartz/dartz.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/repository/recipe_finder_repo.dart';

import '../../../../core/error/failure.dart';

class CreateFoodUseCase {
  CreateFoodUseCase(
    this.recipeFinder,
  );
  final RecipeFinderRepo recipeFinder;

  Future<Either<Failure, String>> execute(String query) async {
    return await recipeFinder.createFood(query);
  }
}
