import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/utils/image_utils.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';

class RoundedAvatarWidget extends StatelessWidget {
  final int animationDuration;
  final double size;
  final String url;

  const RoundedAvatarWidget({
    Key key,
    this.animationDuration = 1000,
    this.size = 64,
    @required this.url,
  }) : super(key: key);

  Widget _getImage(BuildContext context, String url) {
    var isDark = ThemeUtils.isDark(context);

    if (url != null) {
      return ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: ImageUtils.resizeCloudinaryImageFromUrl(
              url, size.toInt(), context),
          placeholder: (context, url) => CircularProgressIndicator(),
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(isDark
            ? 'assets/icons/dark/user_image.png'
            : 'assets/icons/light/user_image.png'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(
          milliseconds: animationDuration,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size / 2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0d000000),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        constraints: BoxConstraints(
          minHeight: size,
          maxHeight: size,
          minWidth: size,
          maxWidth: size,
        ),
        child: _getImage(context, url));
  }
}
