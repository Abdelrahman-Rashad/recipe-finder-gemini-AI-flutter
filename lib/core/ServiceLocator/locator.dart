import 'package:get_it/get_it.dart';
import 'package:recipe_finder/features/Find-Recipe/data/data_source/recipe_finder_dataSource.dart';

import '../../features/Find-Recipe/data/repository/recipe_finder_repo_impl.dart';
import '../../features/Find-Recipe/domain/repository/recipe_finder_repo.dart';
import '../../features/Find-Recipe/domain/usecases/create_food_usecase.dart';
import '../../features/Find-Recipe/domain/usecases/find_recipe_usecase.dart';
import '../../features/Find-Recipe/domain/usecases/get_images_usecase.dart';
import '../../features/Find-Recipe/presentation/statemanagment/cubit/recipe_finder_managment_cubit.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<RecipeFinderDataSource>(
      () => RecipeFinderDataSourceImpl());

  sl.registerLazySingleton<RecipeFinderRepo>(
      () => RecipeFinderRepoImpl(recipeFinderDataSource: sl()));

  sl.registerLazySingleton(() => FindRecipeUseCase(sl()));
  sl.registerLazySingleton(() => GetImagesUseCase(sl()));
  sl.registerLazySingleton(() => CreateFoodUseCase(sl()));
  sl.registerLazySingleton(() => RecipeFinderManagmentCubit(sl(), sl()));
}
