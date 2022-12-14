import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/services/services.dart';
import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/repositories.dart';

/// {@template number_trivia_repository_impl}
/// An implementation of [NumberTriviaRepository].
/// {@endtemplate}
class NumberTriviaRepositoryImpl extends Equatable with NumberTriviaRepository {
  /// {@macro number_trivia_repository_impl}
  const NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// The remote data source to fetch information.
  final NumberTriviaRemoteDataSource remoteDataSource;

  /// The local data source to fetch and to save information.
  final NumberTriviaLocalDataSource localDataSource;

  /// The device network information.
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  }) async {
    if (!await networkInfo.isConnected) {
      try {
        final localNumberTrivia = await localDataSource.getLastNumberTrivia();

        return Right(
          localNumberTrivia.toEntity(),
        );
      } on CacheException catch (exception) {
        return Left(
          CacheFailure(
            message: exception.message,
          ),
        );
      }
    }

    try {
      final remoteNumberTrivia = await remoteDataSource.getNumberTrivia(
        number: number,
        type: type,
      );

      await localDataSource.cacheNumberTrivia(
        triviaToCache: remoteNumberTrivia,
      );

      return Right(
        remoteNumberTrivia.toEntity(),
      );
    } on ServerException catch (exception) {
      log('$exception');

      return Left(
        ServerFailure(
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      );
    } on NotFoundException catch (exception) {
      log('$exception');

      return Left(
        NotFoundFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  List<Object?> get props {
    return [
      remoteDataSource,
      localDataSource,
      networkInfo,
    ];
  }
}
