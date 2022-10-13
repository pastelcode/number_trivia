import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

/// {@template number_trivia_model}
/// A model for [NumberTrivia].
/// {@endtemplate}
class NumberTriviaModel extends Equatable with ModelOf<NumberTrivia> {
  /// {@macro number_trivia_model}
  const NumberTriviaModel({
    required this.text,
    required this.number,
    required this.found,
  });

  /// {@macro number_trivia_model}
  factory NumberTriviaModel.fromJson(
    String str,
  ) {
    return NumberTriviaModel.fromMap(
      json.decode(str) as Map<String, dynamic>,
    );
  }

  /// {@macro number_trivia_model}
  factory NumberTriviaModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return NumberTriviaModel(
      text: json['text'] as String,
      number: json['number'] != null ? (json['number'] as num).toInt() : null,
      found: json['found'] as bool,
    );
  }

  /// {@macro number_trivia__text}
  final String text;

  /// {@macro number_trivia__number}
  final int? number;

  /// Whether the number trivia for [number] was found in API.
  final bool found;

  @override
  NumberTrivia toEntity() {
    return NumberTrivia(
      text: text,
      number: number!,
    );
  }

  @override
  String toJson() {
    return json.encode(
      toMap(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
      'found': found,
    };
  }

  @override
  List<Object?> get props {
    return [
      text,
      number,
      found,
    ];
  }
}
