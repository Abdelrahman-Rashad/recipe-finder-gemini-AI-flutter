import 'dart:convert';

import 'message.dart';

class Choice {
  int? index;
  Message? message;
  dynamic logprobs;
  String? finishReason;

  Choice({this.index, this.message, this.logprobs, this.finishReason});

  factory Choice.fromMap(Map<String, dynamic> data) => Choice(
        index: data['index'] as int?,
        message: data['message'] == null
            ? null
            : Message.fromMap(data['message'] as Map<String, dynamic>),
        logprobs: data['logprobs'] as dynamic,
        finishReason: data['finish_reason'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'message': message?.toMap(),
        'logprobs': logprobs,
        'finish_reason': finishReason,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Choice].
  factory Choice.fromJson(String data) {
    return Choice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Choice] to a JSON string.
  String toJson() => json.encode(toMap());
}
