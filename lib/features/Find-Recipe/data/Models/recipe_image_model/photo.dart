import 'dart:convert';

import 'src.dart';

class Photo {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  Src? src;
  bool? liked;
  String? alt;

  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory Photo.fromMap(Map<String, dynamic> data) => Photo(
        id: data['id'] as int?,
        width: data['width'] as int?,
        height: data['height'] as int?,
        url: data['url'] as String?,
        photographer: data['photographer'] as String?,
        photographerUrl: data['photographer_url'] as String?,
        photographerId: data['photographer_id'] as int?,
        avgColor: data['avg_color'] as String?,
        src: data['src'] == null
            ? null
            : Src.fromMap(data['src'] as Map<String, dynamic>),
        liked: data['liked'] as bool?,
        alt: data['alt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'width': width,
        'height': height,
        'url': url,
        'photographer': photographer,
        'photographer_url': photographerUrl,
        'photographer_id': photographerId,
        'avg_color': avgColor,
        'src': src?.toMap(),
        'liked': liked,
        'alt': alt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Photo].
  factory Photo.fromJson(String data) {
    return Photo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Photo] to a JSON string.
  String toJson() => json.encode(toMap());
}
