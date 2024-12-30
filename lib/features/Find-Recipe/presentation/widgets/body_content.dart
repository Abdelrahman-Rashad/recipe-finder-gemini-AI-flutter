// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_finder/features/Find-Recipe/data/Models/gemini_model/gemini_recipe_details.dart';
import 'package:recipe_finder/main.dart';

import '../../../../core/utiles/styles.dart';
import '../../../../generated/l10n.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
    required this.responseContent,
  });

  final RecipeDetails responseContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
        Container(
          padding: const EdgeInsets.all(17),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment:
                isArabic() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                responseContent.recipeName ?? S.of(context).notFoundTitle,
                style: TextAppStyles.stylefont20home,
              ),
              Divider(
                color: Color(0xFFD0DAE9),
                indent: 20,
                endIndent: 20,
              ),
              Text(
                S.of(context).description,
                style: TextAppStyles.stylefont17,
              ),
              SizedBox(height: 8),
              Text(
                responseContent.recipeDescription ??
                    S.of(context).notFoundDescription,
                style: TextAppStyles.stylefont15,
              ),
              Divider(
                color: Color(0xFFD0DAE9),
                indent: 20,
                endIndent: 20,
              ),
              Text(S.of(context).ingredients, style: TextAppStyles.stylefont17),
              SizedBox(height: 8),
              Directionality(
                textDirection:
                    isArabic() ? TextDirection.rtl : TextDirection.ltr,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: (responseContent.recipeIngredients ??
                          List.from([S.of(context).notFoundIngredients]))
                      .map((e) => Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Color(0xFF1FCC79),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  e,
                                  style: TextAppStyles.stylefont15strong,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
              Divider(
                color: Color(0xFFD0DAE9),
                indent: 20,
                endIndent: 20,
              ),
              Text(S.of(context).instructions,
                  style: TextAppStyles.stylefont17),
              SizedBox(height: 8),
              Directionality(
                textDirection:
                    isArabic() ? TextDirection.rtl : TextDirection.ltr,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: (responseContent.recipeInstructions ??
                          List.from([S.of(context).notFoundInstructions]))
                      .map((e) => Text(
                            "-  $e",
                            style: TextAppStyles.stylefont15strong,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
