import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_finder/features/Find-Recipe/data/Models/recipe_image_model/recipe_image_model.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/usecases/find_recipe_usecase.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/usecases/get_images_usecase.dart';

import '../../../data/Models/gemini_model/gemini_recipe_details.dart';

part 'recipe_finder_managment_state.dart';

class RecipeFinderManagmentCubit extends Cubit<RecipeFinderManagmentState> {
  RecipeFinderManagmentCubit(this.findRecipeUseCase, this.getImagesUseCase)
      : super(RecipeFinderManagmentInitial());
  final FindRecipeUseCase findRecipeUseCase;
  final GetImagesUseCase getImagesUseCase;

  Future<void> findRecipes(String query) async {
    emit(RecipeFinderManagmentLoading());
    final response = await findRecipeUseCase.execute(query);
    response.fold(
      (failure) => emit(RecipeFinderManagmentFailed(failure.message)),
      (responseContent) async {
        final imageResponse = await getImagesUseCase.execute(query);
        imageResponse.fold(
          (failure) => emit(RecipeFinderManagmentFailed(failure.message)),
          (recipeImageModel) {
            emit(RecipeFinderManagmentSuccess(
                recipeImageModel, responseContent));
          },
        );
      },
    );
  }

  void changeLanguage(String lang) {
    emit(RecipeFinderManagmentLanguage(lang));
  }
}
