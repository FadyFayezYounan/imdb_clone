import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static Future<void> shareText({
    required String text,
    String? linkUrl,
  }) async {
    String sharedText = text;
    if (linkUrl != null) {
      sharedText = '$text \n\n$linkUrl';
    }
    await Share.share(sharedText);
  }
  // you can add also share files method.
}
