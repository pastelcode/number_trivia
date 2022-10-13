import 'package:number_trivia/gen/assets.gen.dart';

/// A class with basic information for this app like repository url, developer
/// name, etc.
mixin AppInformation {
  /// The name of the company.
  static String get companyName => 'Pastel Code';

  /// The logo of the company
  static SvgGenImage get companyLogo => Assets.illustrations.pastelcode;

  /// The url of the company website.
  static Uri get companyWebsite => Uri.https(
        'pastelcode.dev',
      );

  /// The remote repository of this app.
  static Uri get repository => Uri.https(
        'github.com',
        '/pastelcode/number_trivia',
      );
}
