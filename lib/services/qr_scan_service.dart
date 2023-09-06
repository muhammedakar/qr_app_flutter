import 'package:url_launcher/url_launcher.dart';

class QRScanService {
  void launcher(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      try {
        await launchUrl(Uri.parse("https://$url")).onError(
            (error, stackTrace) => launchUrl(Uri.parse("http://$url")));
      } catch (e) {
        throw 'Web sitesi açılamıyor:';
      }
    }
  }
}
