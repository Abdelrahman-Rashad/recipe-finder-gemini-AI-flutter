import 'package:flutter/material.dart';

import '../../data/Models/recipe_image_model/recipe_image_model.dart';

class DisplayImages extends StatelessWidget {
  const DisplayImages({
    super.key,
    required this.recipeImageModel,
  });

  final RecipeImageModel? recipeImageModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.4,
        width: double.infinity,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: recipeImageModel!.photos!.length > 2
                  ? NetworkImage(recipeImageModel!.photos![2].src!.medium!)
                  : AssetImage("assets/images/Image-not-found.png"),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
