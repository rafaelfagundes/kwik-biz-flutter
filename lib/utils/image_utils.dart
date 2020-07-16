import 'package:flutter/material.dart';

class ImageUtils {
  static String resizeCloudinaryImage(
      String name, int size, BuildContext context) {
    if (name == null) return null;
    if (name.indexOf('cloudinary.com') < 0) {
      return name;
    }
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    const String _cloudinaryId = 'kardappio';

    String url =
        'https://res.cloudinary.com/$_cloudinaryId/image/upload/c_scale,w_${(size * pixelRatio).toInt()}/$name';
    return url;
  }

  static String resizeCloudinaryImageFromUrl(
      String url, int size, BuildContext context) {
    if (url == null) return null;
    if (url.indexOf('cloudinary.com') < 0) {
      return url;
    }
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;

    const String _cloudinaryId = 'kardappio';

    var strings = url.split('/');
    String name = strings[strings.length - 1];
    String finalUrl;

    if (url.indexOf('kwik/assets/img/credit_cards/') > 0) {
      finalUrl =
          'https://res.cloudinary.com/$_cloudinaryId/image/upload/c_scale,w_${(size * pixelRatio).toInt()}/kwik/assets/img/credit_cards/$name';
    } else {
      finalUrl =
          'https://res.cloudinary.com/$_cloudinaryId/image/upload/c_scale,w_${(size * pixelRatio).toInt()}/$name';
    }

    return finalUrl;
  }
}
