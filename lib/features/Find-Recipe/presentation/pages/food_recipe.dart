import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_finder/features/Find-Recipe/presentation/statemanagment/cubit/recipe_finder_managment_cubit.dart';
import '../../../../core/utiles/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/body_content.dart';
import '../widgets/display_images.dart';

class FoodRecipe extends StatefulWidget {
  const FoodRecipe({
    super.key,
  });

  @override
  State<FoodRecipe> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<FoodRecipe> {
  var responseContent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<RecipeFinderManagmentCubit,
              RecipeFinderManagmentState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is RecipeFinderManagmentSuccess) {
                return Stack(
                  children: [
                    DisplayImages(recipeImageModel: state.recipeImageModel),
                    BodyContent(responseContent: state.responseContent),
                  ],
                );
              }
              if (state is RecipeFinderManagmentFailed) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          S.of(context).modelFailed,
                          style: TextAppStyles.stylefont18,
                        ),
                      ),
                      Lottie.asset('assets/animations/failed.json',
                          height: 250, width: 250),
                    ],
                  ),
                );
              }
              if (state is RecipeFinderManagmentLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Lottie.asset('assets/animations/loading.json',
                          height: 300, width: 300),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
