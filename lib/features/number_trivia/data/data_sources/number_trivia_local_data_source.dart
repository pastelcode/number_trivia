import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template number_trivia_local_data_source}
/// An interface for number trivia local data source.
/// {@endtemplate}
mixin NumberTriviaLocalDataSource {
  /// Gets the last [NumberTriviaModel] that was saved to local cache.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Saves a [NumberTriviaModel] to local cache.
  Future<void> cacheNumberTrivia({
    required NumberTriviaModel triviaToCache,
  });
}

/// {@template number_trivia_local_data_source_impl}
/// An implementation for [NumberTriviaLocalDataSource].
/// {@endtemplate}
class NumberTriviaLocalDataSourceImpl with NumberTriviaLocalDataSource {
  /// {@macro number_trivia_local_data_source_impl}
  const NumberTriviaLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  /// The shared preferences service to cache a number trivia data.
  final SharedPreferences sharedPreferences;

  /// The shared preferences key to set and get the data.
  static String get sharedPreferencesKey => 'CACHED_NUMBER_TRIVIA';

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() async {
    final cachedJson = sharedPreferences.getString(
      sharedPreferencesKey,
    );

    if (cachedJson == null) {
      throw const CacheException(
        message: 'There is not a number trivia previously cached',
      );
    }

    final numberTriviaModel = NumberTriviaModel.fromJson(
      cachedJson,
    );
    return numberTriviaModel;
  }

  @override
  Future<void> cacheNumberTrivia({
    required NumberTriviaModel triviaToCache,
  }) async {
    await sharedPreferences.setString(
      sharedPreferencesKey,
      triviaToCache.toJson(),
    );
  }
}
