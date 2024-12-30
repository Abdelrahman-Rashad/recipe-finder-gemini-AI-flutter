import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipe_finder/core/ServiceLocator/locator.dart';
import 'package:recipe_finder/core/utiles/dio_helper_images.dart';
import 'package:recipe_finder/features/Find-Recipe/domain/usecases/get_images_usecase.dart';
import 'package:recipe_finder/features/Find-Recipe/presentation/pages/home.dart';
import 'package:recipe_finder/features/Find-Recipe/presentation/statemanagment/cubit/recipe_finder_managment_cubit.dart';
import 'core/utiles/dio_helper_qwen.dart';
import 'features/Find-Recipe/domain/usecases/find_recipe_usecase.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';

void main() async {
  await dotenv.load();
  // log(dotenv.env['huggingface']!);
  // OpenAI.apiKey = dotenv.env['huggingface']!;
  DioHelperQwen.init("BASEURLMODEL");
  DioHelper.init("BASEURL");
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeFinderManagmentCubit(
              sl<FindRecipeUseCase>(), sl<GetImagesUseCase>()),
        ),
      ],
      child:
          BlocBuilder<RecipeFinderManagmentCubit, RecipeFinderManagmentState>(
        builder: (context, state) {
          if (state is RecipeFinderManagmentLanguage) {
            S.load(Locale(state.Language));
          }
          return MaterialApp(
            locale: Locale("en"),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // Arabic
              const Locale('en', ''), // English
            ],
            home: Home(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
