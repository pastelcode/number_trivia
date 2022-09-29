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
  const NetworkInfoImpl();

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => throw UnimplementedError();
}
