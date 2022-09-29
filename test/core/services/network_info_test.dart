import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/services/services.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late MockInternetConnectionChecker internetConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUp(
    () {
      internetConnectionChecker = MockInternetConnectionChecker();
      networkInfo = NetworkInfoImpl(
        connectionChecker: internetConnectionChecker,
      );
    },
  );

  group(
    'isConnected',
    () {
      test(
        'should forward the call to InternetConnectionChecker.hasConnection',
        () async {
          // arrange
          final hasConnectionFuture = Future.value(true);

          when(
            () {
              return internetConnectionChecker.hasConnection;
            },
          ).thenAnswer(
            (
              _,
            ) {
              return hasConnectionFuture;
            },
          );

          // act
          final result = networkInfo.isConnected;

          // assert
          verify(
            () {
              return internetConnectionChecker.hasConnection;
            },
          );
          expect(
            result,
            hasConnectionFuture,
          );
        },
      );
    },
  );
}
