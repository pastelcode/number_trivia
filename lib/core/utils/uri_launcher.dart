import 'package:url_launcher/url_launcher.dart';

/// Opens [uri] in the default application on the device.
Future<void> launchUri({
  required Uri uri,
}) async {
  if (!await launchUrl(
    uri,
  )) {
    return;
  }
}
