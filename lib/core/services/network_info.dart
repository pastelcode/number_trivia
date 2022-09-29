import 'package:internet_connection_checker/internet_connection_checker.dart';

/// {@template network_info}
/// A class to get device network information.
/// {@endtemplate}
mixin NetworkInfo {
  /// Whether device has Internet connection.
  Future<bool> get isConnected;
}

/// {@template network_info_impl}
/// An implementation for [NetworkInfo].
/// {@endtemplate}
class NetworkInfoImpl with NetworkInfo {
  /// {@macro network_info_impl}
  const NetworkInfoImpl({
    required this.connectionChecker,
  });

  /// The connection checker service.
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
