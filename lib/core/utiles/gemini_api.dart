import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApi {
  Future<GenerateContentResponse> setUpGeminiAPI(String foodName) async {
    final recipeDetailsSchema = Schema.object(
      properties: {
        'recipeName': Schema.string(
            description: 'The name of the recipe.', nullable: false),
        'recipeDescription': Schema.string(
            description: 'A brief description of the recipe.', nullable: false),
        'recipeIngredients': Schema.array(
            items: Schema.string(description: 'each ingredients.'),
            description: 'List of recipe ingredients.',
            nullable: false),
        'recipeInstructions': Schema.array(
            items: Schema.string(description: 'Step-by-step cooking.'),
            description: 'List of recipe instructions.',
            nullable: false),
      },
    );

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: dotenv.env['GEMINI_API_KEY']!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        maxOutputTokens: 500,
        responseSchema: recipeDetailsSchema,
      ),
    );

    final response = await model.generateContent([Content.text(foodName)]);
    return response;
  }
}
