import 'package:http/http.dart' as http;
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

/// {@template number_trivia_remote_data_source}
/// An interface for remote number trivia repository.
/// {@endtemplate}
mixin NumberTriviaRemoteDataSource {
  /// Gets a [NumberTriviaModel].
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  });
}

/// {@template number_trivia_remote_data_source_impl}
/// An implementation for [NumberTriviaRemoteDataSource] using the http library.
/// {@endtemplate}
class NumberTriviaRemoteDataSourceImpl with NumberTriviaRemoteDataSource {
  /// {@macro number_trivia_remote_data_source_impl}
  const NumberTriviaRemoteDataSourceImpl({
    required this.httpClient,
  });

  /// The http client to make all requests to number trivia API.
  final http.Client httpClient;

  @override
  Future<NumberTriviaModel> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  }) async {
    final response = await httpClient.get(
      Uri.https(
        'numbersapi.p.rapidapi.com',
        '/random/${type.name}',
        <String, String>{
          'min': '$number',
          'max': '$number',
          'fragment': 'true',
          'json': 'true',
        },
      ),
      headers: <String, String>{
        'X-RapidAPI-Key': '7c11888394msh02f3be885ae366cp175f69jsn79a301ba3fdd',
        'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }

    return NumberTriviaModel.fromJson(
      response.body,
    );
  }
}
