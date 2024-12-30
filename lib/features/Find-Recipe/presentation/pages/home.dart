import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_finder/core/utiles/styles.dart';
import 'package:recipe_finder/generated/l10n.dart';
import '../../../../main.dart';
import '../statemanagment/cubit/recipe_finder_managment_cubit.dart';
import 'food_recipe.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ToggleButtons(
                          isSelected: [selectedIndex == 0, selectedIndex == 1],
                          onPressed: (index) {
                            setState(() {
                              selectedIndex = index;
                              BlocProvider.of<RecipeFinderManagmentCubit>(
                                      context)
                                  .changeLanguage(
                                      selectedIndex == 0 ? 'en' : 'ar');
                            });
                          },
                          borderRadius: BorderRadius.circular(20),
                          selectedColor: Colors.white,
                          fillColor: Colors.orangeAccent,
                          color: Colors.black,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text('🇺🇸 English'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text('🇪🇬 عربي'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      S.of(context).title,
                      style: TextAppStyles.stylefont22,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Align(
                      alignment: isArabic()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        S.of(context).subTitle,
                        style: TextAppStyles.stylefont20,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      textAlign:
                          selectedIndex == 0 ? TextAlign.left : TextAlign.right,
                      decoration: InputDecoration(
                        hintText: S.of(context).hintSearch,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            radius: 20,
                            child: IconButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<RecipeFinderManagmentCubit>(
                                            context)
                                        .findRecipes(controller.text);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodRecipe()));
                                  }
                                },
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      controller: controller,
                      validator: (value) => value!.isEmpty
                          ? S.of(context).validationSearch
                          : null,
                    ),
                    Lottie.asset("assets/animations/burger-cooking.json",
                        height: 400, width: 400),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
