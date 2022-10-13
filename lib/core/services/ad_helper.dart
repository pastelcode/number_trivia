import 'dart:io';

/// A class that provides Google Mobile Ads IDs.
class AdHelper {
  /// Gets the id for a banner ad unit.
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4540044799630693/3173509668'; // Production
      return 'ca-app-pub-3940256099942544/6300978111'; // Development
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4540044799630693/1369225985'; // Production
      return 'ca-app-pub-3940256099942544/2934735716'; // Development
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
