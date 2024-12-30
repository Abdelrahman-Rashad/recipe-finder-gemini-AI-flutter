import 'dart:convert';

import 'choice.dart';
import 'usage.dart';

class QwenModel {
  String? object;
  String? id;
  int? created;
  String? model;
  String? systemFingerprint;
  List<Choice>? choices;
  Usage? usage;

  QwenModel({
    this.object,
    this.id,
    this.created,
    this.model,
    this.systemFingerprint,
    this.choices,
    this.usage,
  });

  factory QwenModel.fromMap(Map<String, dynamic> data) => QwenModel(
        object: data['object'] as String?,
        id: data['id'] as String?,
        created: data['created'] as int?,
        model: data['model'] as String?,
        systemFingerprint: data['system_fingerprint'] as String?,
        choices: (data['choices'] as List<dynamic>?)
            ?.map((e) => Choice.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: data['usage'] == null
            ? null
            : Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'object': object,
        'id': id,
        'created': created,
        'model': model,
        'system_fingerprint': systemFingerprint,
        'choices': choices?.map((e) => e.toMap()).toList(),
        'usage': usage?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QwenModel].
  factory QwenModel.fromJson(Map<String, dynamic> data) {
    return QwenModel.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [QwenModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
