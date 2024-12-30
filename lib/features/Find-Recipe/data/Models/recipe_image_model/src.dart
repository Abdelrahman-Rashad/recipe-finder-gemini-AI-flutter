import 'dart:convert';

class Src {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory Src.fromMap(Map<String, dynamic> data) => Src(
        original: data['original'] as String?,
        large2x: data['large2x'] as String?,
        large: data['large'] as String?,
        medium: data['medium'] as String?,
        small: data['small'] as String?,
        portrait: data['portrait'] as String?,
        landscape: data['landscape'] as String?,
        tiny: data['tiny'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'original': original,
        'large2x': large2x,
        'large': large,
        'medium': medium,
        'small': small,
        'portrait': portrait,
        'landscape': landscape,
        'tiny': tiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Src].
  factory Src.fromJson(String data) {
    return Src.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Src] to a JSON string.
  String toJson() => json.encode(toMap());
}
