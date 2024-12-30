// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search for a recipe`
  String get title {
    return Intl.message(
      'Search for a recipe',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get subTitle {
    return Intl.message(
      'What\'s on your mind?',
      name: 'subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search by food name...`
  String get hintSearch {
    return Intl.message(
      'Search by food name...',
      name: 'hintSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search by food name...`
  String get validationSearch {
    return Intl.message(
      'Search by food name...',
      name: 'validationSearch',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred! Please try again later.`
  String get modelFailed {
    return Intl.message(
      'An error occurred! Please try again later.',
      name: 'modelFailed',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `No ingredients found`
  String get notFoundIngredients {
    return Intl.message(
      'No ingredients found',
      name: 'notFoundIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `No Instructions found`
  String get notFoundInstructions {
    return Intl.message(
      'No Instructions found',
      name: 'notFoundInstructions',
      desc: '',
      args: [],
    );
  }

  /// `The AI doesn't recognize this food`
  String get notFoundTitle {
    return Intl.message(
      'The AI doesn\'t recognize this food',
      name: 'notFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `No description found`
  String get notFoundDescription {
    return Intl.message(
      'No description found',
      name: 'notFoundDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
