import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:recipe_finder/core/error/failure.dart';
import '../../../../core/utiles/dio_helper_images.dart';
import '../../../../core/utiles/gemini_api.dart';
import '../Models/gemini_model/gemini_recipe_details.dart';
import '../Models/recipe_image_model/recipe_image_model.dart';

abstract class RecipeFinderDataSource {
  Future<RecipeDetails> findRecipes(String foodName);
  Future<String> createFood(String ingredients);
  Future<RecipeImageModel> getImages(String foodName);
}

class RecipeFinderDataSourceImpl implements RecipeFinderDataSource {
  @override
  Future<String> createFood(String ingredients) async {
    return "responseContent";
  }

  bool isArabicTextForm(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text);
  }

  @override
  Future<RecipeDetails> findRecipes(String foodName) async {
    // OpenaiClass openaiClass = OpenaiClass();
    // openaiClass.initializeOpenAI();

    // try {
    //   responseContent = await openaiClass.CreateChatCompletion(foodName);
    //   return responseContent;
    // } on RequestFailedException catch (e) {
    //   throw ServerFailureQwenModel(e.message.toString());
    // }

    // Map<String, dynamic> param = {
    //   "model": "Qwen/Qwen2.5-72B-Instruct",
    //   "messages": [
    //     {
    //       "role": "user",
    //       "name": "get_cook",
    //       "content": "How Can I Cook $foodName"
    //     }
    //   ],
    //   "max_tokens": 500,
    //   "stream": false
    // };
    // Response? response = await DioHelperQwen.postData(
    //     endpoint: dotenv.env['completions']!,
    //     token: dotenv.env["huggingface"],
    //     body: param);
    // if (response!.statusCode == 200) {
    //   log(response.data.toString());
    //   QwenModel qwenModel = QwenModel.fromJson(response.data);
    //   return qwenModel.choices![0].message!.content!;
    // } else {
    //   log(response.data.toString());
    //   Map<String, dynamic> map =
    //       response.data is String ? jsonDecode(response.data) : response.data;
    //   throw ServerFailure(map['error']);
    // }

    // GenerativeAIException
    // RecipeDetails.fromJson(response.text.toString())

    String query;
    GeminiApi geminiApi = GeminiApi();
    isArabicTextForm(foodName)
        ? query =
            "( الاجابه تبقى بالعربى مصرى من غير اى ايموشن او حتى اى رمز هو كلام بس)؟$foodName ازاى اطبخ"
        : query =
            "How to cook $foodName?(the answer will be in english without any emojis)";
    try {
      var response = await geminiApi.setUpGeminiAPI(query);
      return RecipeDetails.fromJson(response.text.toString());
    } on GenerativeAIException catch (e) {
      throw ServerFailure(e.message.toString());
    }
  }

  @override
  Future<RecipeImageModel> getImages(String foodName) async {
    RecipeImageModel? recipeImageModel;
    if (isArabicTextForm(foodName)) {
      DioHelper.dio.options.baseUrl = dotenv.env["MYMEMORYAPI"]!;
      Map<String, dynamic> param = {
        "q": foodName,
        "langpair": "ar|en",
      };
      try {
        Response response = await DioHelper.getData(
            endpoint: dotenv.env["MYMEMORYENDPOINT"]!, body: param);
        foodName = response.data['responseData']['translatedText'];
      } catch (e) {
        throw ServerFailure(e.toString());
      }
    }
    DioHelper.dio.options.baseUrl = dotenv.env["BASEURL"]!;
    Map<String, dynamic> param = {"query": foodName, "page": 1, "per_page": 5};
    Response response = await DioHelper.getData(
        endpoint: dotenv.env["SEARCH"]!,
        token: dotenv.env["PEXELS_KEY"],
        body: param);
    if (response.statusCode == 200) {
      recipeImageModel = RecipeImageModel.fromMap(response.data);
      return recipeImageModel;
    } else {
      throw ServerFailure(response.data['code']);
    }
  }
}
