part of 'recipe_finder_managment_cubit.dart';

@immutable
sealed class RecipeFinderManagmentState {}

final class RecipeFinderManagmentInitial extends RecipeFinderManagmentState {}

final class RecipeFinderManagmentLoading extends RecipeFinderManagmentState {}

final class RecipeFinderManagmentLanguage extends RecipeFinderManagmentState {
  final String Language;

  RecipeFinderManagmentLanguage(this.Language);
}

final class RecipeFinderManagmentSuccess extends RecipeFinderManagmentState {
  final RecipeImageModel recipeImageModel;
  final RecipeDetails responseContent;

  RecipeFinderManagmentSuccess(this.recipeImageModel, this.responseContent);
}

final class RecipeFinderManagmentFailed extends RecipeFinderManagmentState {
  final String message;
  RecipeFinderManagmentFailed(this.message);
}
