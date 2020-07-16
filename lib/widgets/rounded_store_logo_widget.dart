import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedStoreLogoWidget extends StatelessWidget {
  final int animationDuration;
  final double size;
  final String url;
  final String heroId;

  const RoundedStoreLogoWidget({
    Key key,
    this.animationDuration = 1000,
    this.size = 64,
    @required this.url,
    this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (heroId != null) {
      return Hero(
        tag: heroId,
        transitionOnUserGestures: true,
        child: Container(
            child: Logo(
                animationDuration: animationDuration, size: size, url: url)),
      );
    } else {
      return Logo(animationDuration: animationDuration, size: size, url: url);
    }
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.animationDuration,
    @required this.size,
    @required this.url,
  }) : super(key: key);

  final int animationDuration;
  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: animationDuration,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
