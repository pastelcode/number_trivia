import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late NumberTriviaRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient httpClient;

  void setUpMockHttpClientSuccess200() {
    when(
      () {
        return httpClient.get(
          any(),
          headers: any(
            named: 'headers',
          ),
        );
      },
    ).thenAnswer(
      (
        _,
      ) async {
        return http.Response(
          fixture(
            fileName: 'trivia.json',
          ),
          200,
        );
      },
    );
  }

  void setUpMockHttpClientFailure404() {
    when(
      () {
        return httpClient.get(
          any(),
          headers: any(
            named: 'headers',
          ),
        );
      },
    ).thenAnswer(
      (
        _,
      ) async {
        return http.Response(
          'Something went wrong',
          400,
        );
      },
    );
  }

  setUp(
    () {
      httpClient = MockHttpClient();
      remoteDataSource = NumberTriviaRemoteDataSourceImpl(
        httpClient: httpClient,
      );

      registerFallbackValue(
        Uri.https(
          'numbersapi.p.rapidapi.com',
          '/random/${NumberTriviaType.trivia.name}',
          <String, String>{
            'min': '1',
            'max': '1',
            'fragment': 'true',
            'json': 'true',
          },
        ),
      );
    },
  );

  group(
    'getNumberTrivia',
    () {
      const number = 1;
      const numberTriviaType = NumberTriviaType.trivia;
      final numberTriviaModel = NumberTriviaModel.fromJson(
        fixture(
          fileName: 'trivia.json',
        ),
      );

      test(
        'should perform a GET request on a URL with number being the endpoint and with application/json header',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();

          // act
          await remoteDataSource.getNumberTrivia(
            number: number,
            type: NumberTriviaType.trivia,
          );

          // assert
          verify(
            () {
              return httpClient.get(
                Uri.https(
                  'numbersapi.p.rapidapi.com',
                  '/random/${NumberTriviaType.trivia.name}',
                  <String, String>{
                    'min': '1',
                    'max': '1',
                    'fragment': 'true',
                    'json': 'true',
                  },
                ),
                headers: <String, String>{
                  'X-RapidAPI-Key':
                      '7c11888394msh02f3be885ae366cp175f69jsn79a301ba3fdd',
                  'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
                  'Content-Type': 'application/json',
                },
              );
            },
          );
        },
      );

      test(
        'should return NumberTriviaModel when the response code is 200 (success)',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();

          // act
          final result = await remoteDataSource.getNumberTrivia(
            number: number,
            type: numberTriviaType,
          );

          // assert
          expect(
            result,
            equals(
              numberTriviaModel,
            ),
          );
        },
      );

      test(
        'should throw ServerException when status code is 404, 400 or other',
        () async {
          // arrange
          setUpMockHttpClientFailure404();

          // act
          final call = remoteDataSource.getNumberTrivia(
            number: number,
            type: numberTriviaType,
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );
    },
  );
}
