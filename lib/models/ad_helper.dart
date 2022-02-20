import 'dart:io';

class AdHelper {
//facebook ads
  static String get interstitialAdId {
    if (Platform.isAndroid) {
      return "";
    }
    return ""; //ios id must be here
  }

  static String get fbBannerAdId {
    if (Platform.isAndroid) {
      return "296800735446599_301410258318980";
    }
    return "";
  }

//google ads
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3140938214583211/5818873432';
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
