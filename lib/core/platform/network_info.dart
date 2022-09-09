part of 'platform.dart';

/// {@template network_info}
/// A class to get device network information.
/// {@endtemplate}
mixin NetworkInfo {
  /// Whether device has Internet connection.
  Future<bool> get isConnected;
}
