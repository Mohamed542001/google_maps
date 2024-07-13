import '../src/app_export.dart';

class UrlLauncher {
  static Future<void> launchUrlMethod(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch URL. Launching in web browser.');
        await launchUrl(Uri.parse(url));
      }
    } on PlatformException catch (e) {
      print('Error launching URL: $e');
      if (e.code == 'ACTIVITY_NOT_FOUND') {
        print('No app found to handle the URL.');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
